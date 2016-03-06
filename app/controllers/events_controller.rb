class EventsController < ApplicationController
  def event_params
    params.require(:event).permit(:description, :end_date, :end_time, :event_organizer, :name, :start_date, :start_time, :location, :creator_name, :creator_email)
  end
  
  def index
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.create!(event_params)
    flash[:notice] = "#{@event.name} was successfully created."
    redirect_to events_path
  end
end
