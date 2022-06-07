require "json"

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @step = Step.new
    @steps = Step.where(project_id: params[:id]).order(start_date: :asc)
    @stepcounter = @steps.count - 1
    @collaborators = Traveler.where(project_id: params[:id]).where(privilege: "collaborator")
    @markers = @steps.geocoded.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude
      }
    end
  end

  def new
    @project = Project.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @traveler = Traveler.new
      @traveler.user_id = current_user.id
      @traveler.privilege = "admin"
      @traveler.project_id = @project.id
      if @traveler.save
        params[:project][:collab].split(",").each do |collab|
          @traveler = Traveler.new
          @traveler.user_id = collab
          @traveler.privilege = "collaborator"
          @traveler.project_id = @project.id
          @traveler.save
        end
        redirect_to edit_project_path(@project)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @project.season = params[:season]
    @project.save
  end

  def update
    @project.update(project_params)
    redirect_to new_project_step_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to myprojects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :profil, :total_budget, :photo, :season, :transport, :theme, :collab)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
