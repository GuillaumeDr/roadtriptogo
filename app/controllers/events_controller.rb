class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # redirect_to new_project_step_path(@event)
    else
      render template: "events/show"
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:type, :name, :address, :duration, :description, :price, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
