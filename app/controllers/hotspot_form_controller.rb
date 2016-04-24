class HotspotFormController < ApplicationController
    include Wicked::Wizard
    steps :issue_description, :personal_information
    before_filter :redirect_to

    def show
      render_wizard
    end
    
    def update
      render_wizard form
    end
    
    def form 
      @form = form_object.new(model)
    end
    
    def model
      @model = case step
        when :issue_description then hotspot
        when :personal_information then hotspot
        end
    end
    
    def form_object
        case step
        when :issue_description then IssueDescriptionForm
        when :personal_information then PersonalInformationForm
        end
    end
    
    
    ####
    
      private
    
      def redirect_to_first_invalid_step
        # don't check previous steps on first step
        return if steps[0] == step
        steps.to(steps.index(step) - 1).each do |s|
          jump_to s unless form_object(s).new(model).validate({})
        end
      end
    
    ####
        
end