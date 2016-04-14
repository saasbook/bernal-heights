class Admin::HotspotsController < ApplicationController
  before_filter :is_admin
  
  def is_admin
    if !admin_signed_in?
      flash[:notice] = "You must be an administrator to see this page"
      redirect_to events_path
    end
  end
  
  
  def index
    @all_regions = Hotspot.all_regions
    #@hotspots = Hotspot.all
    @selected_regions = params[:regions] || {}
    if @selected_regions == {}
      @selected_regions = Hash[@all_regions.map {|region| [region, region]}]
    end
    @hotspots = Hotspot.where(region: @selected_regions.keys)
    
    @hash = Gmaps4rails.build_markers(@hotspots) do |hotspot, marker|
      marker.lat hotspot.latitude
      marker.lng hotspot.longitude
      marker.infowindow hotspot.issue_type
    end
  end
  
  def destroy
    @hotspot = Hotspot.find(params[:id])
    @hotspot.destroy
    redirect_to admin_hotspots_path
  end
end
