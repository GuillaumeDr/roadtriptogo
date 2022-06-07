class TodolistsController < ApplicationController

  def show
    @task = Task.new
    @project = Project.find(params[:project_id])
    @tasks = @project.todolist.tasks.order(:created_at)
    @todolist = Todolist.find(params[:id])
    @chatroom = Chatroom.find_by(project_id: @project.id)
  end

end
