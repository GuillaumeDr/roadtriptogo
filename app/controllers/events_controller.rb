class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @event = Event.new
    @project = Project.find(params[:project_id])
    @chatroom = Chatroom.find_by(project_id: @project.id)
    @todolist = Todolist.find_by(project_id: @project.id)
    @steps = @project.steps
    @events = @project.events
    @project_date_start = @steps.first.start_date
    @project_end_start = @steps.last.end_date
  end

  def create
    @step = Step.find(params[:event][:step_id])
    @event = Event.new(event_params)
    @event.step = @step
    if @event.save
      redirect_to project_events_path
    else
      render 'shared/form', project: @project, step: @step, event: @event
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @step = Step.find(params[:step_id])
  end

  def update
    @event.update(event_params)
    @project = Project.find(params[:project_id])
    @step = Step.find(params[:step_id])
    if @step.save
      redirect_to project_step_event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    @project = Project.find(params[:project_id])
    @step = Step.find(params[:step_id])
    redirect_to project_step_event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:event_type, :name, :address, :duration, :description, :price, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
