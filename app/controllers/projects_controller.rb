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
    @chatroom = Chatroom.find_by(project_id: params[:id])
    @todolist = Todolist.find_by(project_id: params[:id])
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
    @users = User.where.not(id: current_user.id)

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
        @chatroom = Chatroom.new
        @chatroom.project_id = @project.id
        @chatroom.name = "#{@project.name} messagerie"
        @chatroom.save
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
    @todolist = Todolist.new
    @todolist.project_id = @project.id
    @todolist.save
    generate_todo
  end

  def destroy

    @project.destroy
    redirect_to myprojects_path
  end

  def generate_todo
    if @project.season == 'été' && @project.transport == 'voiture'
      Task::TODOLIST_ETE_VOITURE.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'été' && @project.transport == 'avion'
      Task::TODOLIST_ETE_AVION.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'été' && @project.transport == 'train'
      Task::TODOLIST_ETE_TRAIN.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'automne' && @project.transport == 'voiture'
      Task::TODOLIST_AUTOMNE_VOITURE.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'automne' && @project.transport == 'avion'
      Task::TODOLIST_AUTOMNE_AVION.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'automne' && @project.transport == 'train'
      Task::TODOLIST_AUTOMNE_TRAIN.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'hiver' && @project.transport == 'voiture'
      Task::TODOLIST_HIVER_VOITURE.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'hiver' && @project.transport == 'avion'
      Task::TODOLIST_HIVER_AVION.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'hiver' && @project.transport == 'train'
      Task::TODOLIST_HIVER_TRAIN.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'printemps' && @project.transport == 'voiture'
      Task::TODOLIST_PRINTEMPS_VOITURE.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'printemps' && @project.transport == 'avion'
      Task::TODOLIST_PRINTEMPS_AVION.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    elsif @project.season == 'printemps' && @project.transport == 'train'
      Task::TODOLIST_PRINTEMPS_TRAIN.each do |t|
        @task = Task.new
        @task.description = t
        @task.todolist_id = @todolist.id
        @task.save
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :profil, :total_budget, :photo, :season, :transport, :theme, :collab)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
