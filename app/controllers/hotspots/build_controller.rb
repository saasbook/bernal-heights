class Hotspots::BuildController < ApplicationController
    include Wicked::Wizard
    
    steps :issue_description, :personal_information
    
    def show
        # @hotspot = Hotspot.find(params[:hotspot_id])
        @hotspot = Hotspot.create
        @all_issues = Hotspot.all_issues
        render_wizard
    end
    
    def update
        @hotspot = Hotspot.find(params[:hotspot_id])
        params[:hotspot][:status] = 'active' if step == steps.last
        @hotspot.update_attributes(params[:hotspot])
        render_wizard @hotspot
    end
    
    def create 
        @hotspot = Hotspot.create
        @all_issues = Hotspot.all_issues
        redirect_to wizard_path(steps.first, :hotspot_id => @hotspot.id)
    end
end