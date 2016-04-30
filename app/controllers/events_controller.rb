class EventsController < ApplicationController

  def index
      @events = Event.where(approved: true)
      @todays_events = Event.getEventsForDay(Time.zone.now.to_date.strftime("%F"))
    if request.xhr?
      @todays_events = Event.getEventsForDay(params[:day])
      render :partial => 'layouts/event_list'
    end
  end
  
  def show
    @event = Event.find(params[:id])
    session[:return_to] ||= request.referer
  end
  
  def new
    if current_admin
      redirect_to new_admin_event_path
    end
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "#{@event.name} was successfully created."
      redirect_to events_path
    else 
      # flash[:error] = @event.errors
      flash.now[:warning] = "You have not filled out all required fields."
      render :new
    end
  end

  
  private
  
  def event_params
    params.require(:event).permit(:description, :end_date, :end_time, :event_organizer, :name, :start_date, :start_time, :location, :creator_name, :creator_email)
  end
end
