class TodolistsController < ApplicationController

  def show
    @project = Project.find(params[:project_id])
    @tasks = @project.todolist.tasks
    @todolist = Todolist.find(params[:id])
    @chatroom = Chatroom.find_by(project_id: @project.id)
  end

end
