class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @event = Event.new
    # @events = Event.all
    @project = Project.find(params[:project_id])
    @steps = @project.steps
    @events = @project.events
  end

  def create
    @step = Step.find(params[:step_id])
    @event = Event.new(event_params)
    @event.step = @step
    if @event.save
      redirect_to project_step_events_path
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
