class Admin::EventsController < EventsController
  def confirm
    @events = Events.get_all_unconfirmed
  end

  def delete
    @event = Event.find_by_id(params[:id])
    @event.destroy
  end
end
