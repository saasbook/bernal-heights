class Admin::EventsController < EventsController
  before_filter :is_admin

  def index
    @events = Event.where(approved: false)
  end
  
  def confirm
    @event = Event.find(params[:event_id])
    @event.confirm
    flash[:notice] = "Event Approved"
    redirect_to admin_events_path
  end

  def delete
    @event = Event.find(params[:id])
    @event.destroy
  end
end
