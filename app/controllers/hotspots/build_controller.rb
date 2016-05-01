class Hotspots::BuildController < ApplicationController
    include Wicked::Wizard
    
    steps :basic_issue, :issue_description, :personal_information
    
    def hotspot_params
        params.require(:hotspot).permit(:location, :occurred_time, :occurred_date, :details, :report_num, :to_share, :creator_name, :creator_email, :creator_number, :walk,:status, issue_ids: [])
    end
  
    def show
        @hotspot = Hotspot.find(params[:hotspot_id])
        @all_issues = Hotspot.all_issues
        render_wizard
    end
    
    def update
        @hotspot = Hotspot.find(params[:hotspot_id])
        @all_issues = Hotspot.all_issues
        params[:hotspot][:status] = step.to_s
        params[:hotspot][:status] = 'active' if step == steps.last
        @hotspot.update_attributes(hotspot_params)
        if step == steps.last and @hotspot.save
            flash[:notice] = "You have successfully reported an issue. Thank you!"
            redirect_to hotspots_path and return
        elsif not @hotspot.save
            if @hotspot.errors.any? 
              flash.now[:warning] = @hotspot.errors.full_messages.first 
            else
              flash.now[:warning] = "You have not filled out all required fields."
            end
        end
        render_wizard @hotspot
    end
    
    def create 
        @hotspot = Hotspot.create(:status => 'new')
        @all_issues = Hotspot.all_issues
        redirect_to wizard_path(steps.first, :hotspot_id => @hotspot.id)
    end
end