class Admin::HotspotsController < ApplicationController
  before_filter :is_admin
  
  def index
    @all_regions = Hotspot.all_regions
    @selected_regions = params[:regions] || {}
    if @selected_regions == {}
      @selected_regions = Hash[@all_regions.map {|region| [region, region]}]
    end

    @all_issues = Hotspot.all_issues
    @selected_issues = params[:issues] || {}
    if @selected_issues == {}
      @selected_issues = Hash[@all_issues.map {|issue| [issue, issue]}]
    end
    
    @hotspots = Hotspot.where(region: @selected_regions.keys, archive: false).joins(:issues).where(:issues => { :issue_type => @selected_issues.keys}).references(:issues).distinct()
    
    @hash = Gmaps4rails.build_markers(@hotspots) do |hotspot, marker|
      marker.lat hotspot.latitude
      marker.lng hotspot.longitude
      marker.infowindow hotspot.issue_types
    end
    
    respond_to do |format|
      format.html
      format.csv { send_data Hotspot.to_csv(@hotspots), filename: "hotspots-data-#{Date.today}.csv" }
    end
  end
  
  def destroy
    @hotspot = Hotspot.find(params[:id])
    @hotspot.destroy
    redirect_to admin_hotspots_path
  end
  
  def update
    @hotspot = Hotspot.find(params[:id])
    if @hotspot.update(archive: true)
      flash[:notice] = "You have successfully archived hotspot #{params[:id]}."
    else
      flash[:notice] = "Fail attempt to archive hotspot #{params[:id]}."
    end
    redirect_to admin_hotspots_path
  end
  
  def show
    @hotspot = Hotspot.find(params[:id])
  end
  
end
