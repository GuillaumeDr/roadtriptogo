class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:edit, :update, :destroy]

  def new
    @todolist = Todolist.new
  end

  def create
    @project = Project.find(params[:project_id])
    @todolist = Todolist.new(todolist_params)
    @todolist.project = @project
    if @todolist.save
      redirect_to project_todolists_path
    else
      # render 'shared/form', project: @project, todolist: @todolist
    end
  end

  def edit
  end

  def update
    @todolist.update(todolist_params)
    if @step.save
      redirect_to project_step_todolist_path(@todolist)
    else
      render :new
    end
  end

  def destroy
    @todolist.destroy
    redirect_to project_todolist_path(@todolist)
  end

  private

  def todolist_params
    params.require(:todolist).permit(:project_id)
  end

  def set_todolist
    @project = Project.find(params[:project_id])
    @todolist = Todolist.find(params[:id])
    @todolist.project = @project
  end
end
