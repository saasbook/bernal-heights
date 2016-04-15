class HotspotsController < ApplicationController
  def hotspot_params
    params.require(:hotspot).permit(:hotspotissues,:location, :occurred_time, :occurred_date, :details, :report_num, :to_share, :creator_name, :creator_email, :creator_number, :walk)
  end
  
  def index
    @hotspots = Hotspot.all
  end
  
  def new
    @hotspot = Hotspot.new
    @all_issues = Hotspot.all_issues
  end
  
  def index
    @hotspots = Hotspot.all
    @hash = Gmaps4rails.build_markers(@hotspots) do |hotspot, marker|
      marker.lat hotspot.latitude
      marker.lng hotspot.longitude
      marker.infowindow hotspot.issue_types
    end
  end

  def create
    @selected_issues = params[:issues]
    @hotspot = Hotspot.new(hotspot_params)
    @all_issues = Hotspot.all_issues
    if @hotspot.save and not(params[:issues] == {})
        @selected_issues.each do |issue|
          @hotspot.issues << Issue.where(issue_type: issue)
        end
        
        flash[:notice] = "You have successfully reported an issue. Thank you!"
        redirect_to new_hotspot_path
    else
        flash.now[:warning] = "You have not filled out all required fields."
        render :new
    end
  end
  
  def destroy
    @hotspot = Hotspot.find(params[:id])
    @hotspot.destroy
    redirect_to hotspots_path
  end
end
