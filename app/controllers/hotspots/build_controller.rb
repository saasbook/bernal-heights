class Hotspots::BuildController < ApplicationController
    include Wicked::Wizard
    
    steps :basic_issue, :issue_description, :personal_information
    
    def hotspot_params
        params.require(:hotspot).permit(:location, :occurred_time, :occurred_date, :details, :report_num, :to_share, :creator_name, :creator_email, :creator_number, :walk)
    end
  
    def show
        @hotspot = Hotspot.find(params[:hotspot_id])
        @all_issues = Hotspot.all_issues
        render_wizard
    end
    
    def update
        @hotspot = Hotspot.find(params[:hotspot_id])
        @all_issues = Hotspot.all_issues
        params[:hotspot][:status] = "first" if step == steps.first
        params[:hotspot][:status] = "last" if step == steps.last
        @hotspot.update_attributes(hotspot_params)
        if step == steps.first
            @selected_issues = params[:issues] || {}
            if @selected_issues == {}
                flash.now[:warning] = "You have not selected an issue type."
            else
                @selected_issues.each do |issue|
                    @hotspot.issues << Issue.where(issue_type: issue)
                end
            end
        end
        render_wizard @hotspot
    end
    
    # def index
    #     @hotspot = Hotspot.create
    #     @all_issues = Hotspot.all_issues
    #     redirect_to wizard_path(steps.first, :hotspot_id => @hotspot.id)
    # end
    
    def create 
        @hotspot = Hotspot.create(:status => "new")
        @all_issues = Hotspot.all_issues
        redirect_to wizard_path(steps.first, :hotspot_id => @hotspot.id)
    end
end