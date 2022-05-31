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
    @project.user_id = current_user.id
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
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
    params.require(:project).permit(:name, :description, :theme, :profil, :total_budget, :photo)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
