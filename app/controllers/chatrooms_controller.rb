class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @project = Project.find_by(id: @chatroom.project_id)
    @todolist = Todolist.find_by(project_id: @project.id)
    @collaborators = Traveler.where(project_id: @project.id).where(privilege: "collaborator")
  end
end
