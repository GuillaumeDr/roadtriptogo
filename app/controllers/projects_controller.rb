class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @traveler = Traveler.new
      @traveler.user_id = current_user.id
      @traveler.privilege = "admin"
      @traveler.project_id = @project.id
      if @traveler.save
        redirect_to new_project_step_path(@project)
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
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to myprojects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :theme, :profil, :total_budget, :photo, :season, :transport)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
