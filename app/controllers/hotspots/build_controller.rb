class Hotspots::BuildController < ApplicationController
    include Wicked::Wizard
    
    steps :issue_description, :personal_information
    
    def hotspot_params
        params.require(:hotspot).permit(:hotspotissues,:location, :occurred_time, :occurred_date, :details, :report_num, :to_share, :creator_name, :creator_email, :creator_number, :walk)
    end
  
    def show
        @hotspot = Hotspot.find(params[:hotspot_id])
        @all_issues = Hotspot.all_issues
        render_wizard
    end
    
    def update
        @hotspot = Hotspot.find(params[:hotspot_id])
        @all_issues = Hotspot.all_issues
        params[:hotspot][:status] = 'active' if step == steps.last
        @hotspot.update_attributes(hotspot_params)
        render_wizard @hotspot
    end
    
    def index
        @hotspot = Hotspot.create
        @all_issues = Hotspot.all_issues
        redirect_to wizard_path(steps.first, :hotspot_id => @hotspot.id)
    end
    
    def create 
        @hotspot = Hotspot.create
        @all_issues = Hotspot.all_issues
        redirect_to wizard_path(steps.first, :hotspot_id => @hotspot.id)
    end
end