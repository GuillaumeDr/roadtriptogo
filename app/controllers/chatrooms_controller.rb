class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @project = Project.find_by(id: @chatroom.project_id)
  end
end
