class Admin::EventsController < EventsController
  before_filter :is_admin

  def index
    @events = Event.get_all_approved
    @unapproved = Event.get_all_unconfirmed
    @todays_events = Event.getEventsForDay(Date.today.strftime("%F"))
    if request.xhr?
      @todays_events = Event.getEventsForDay(params[:day])
      render :partial => 'layouts/event_list'
    end
  end

  def unapproved
    @unapproved = Event.get_all_unconfirmed
  end
  
  def new
    @event = Event.new
    render 'admin/events/new'
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      @event.confirm
      flash[:notice] = "#{@event.name} was successfully created."
      redirect_to admin_events_path
    else 
      # flash[:error] = @event.errors
      flash.now[:warning] = "You have not filled out all required fields."
      render :new
    end
  end
  
  def confirm
    @event = Event.find(params[:event_id])
    @event.confirm
    flash[:notice] = "Event Approved"
    redirect_to admin_unapproved_events_path
  end

  def delete
    @event = Event.find(params[:id])
    @event.destroy
  end
end
