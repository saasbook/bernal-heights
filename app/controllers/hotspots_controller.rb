class HotspotsController < ApplicationController
  def hotspot_params
    params.require(:hotspot).permit(:hotspotissues,:location, :occurred_time, :occurred_date, :details, :report_num, :to_share, :creator_name, :creator_email, :creator_number, :walk)
  end
  
  def index
    @hotspots = Hotspot.all
  end
  
  def gps
    if request.xhr?
        @coordinates = Geocoder.coordinates(params[:coords])
        @lat = @coordinates[0]
        @lng = @coordinates[1]
        render :json => {
                            :lat => @lat, :lng => @lng
                        }
    end
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
        if @hotspot.errors.any? 
          flash.now[:warning] = @hotspot.errors.full_messages.first 
        else
          flash.now[:warning] = "You have not filled out all required fields."
        end
        render :new
    end
  end
  
end
