# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the All Events page$/ then '/events'
    when /^the New Event page$/ then '/events/new'
    

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    when /^the sign in page$/
      '/admin/sign_in'
    
    when /^the sign up page$/
      '/admin/sign_up'
      
    when /^the events page$/
      '/events'
    
    when /^the Hotspot map page$/
      '/hotspots'
    
    when /^the Hotspot form page$/
      hotspot_build_index_path(:hotspot_id => "building")
    
    when /^the home page$/
      '/events'
    
    when /^the approve events page$/
      '/admin/events/unapproved'
      
    when /^the sign out page$/
      sign_out_path
      
    when /^the admin home page$/
      '/admin'
      
    when /^the edit account info page$/
      '/admin/edit'
      
    when /^the add resource path$/
      '/resources/new'
      
    when /^the add new admin page$/
      '/staff/new'
    
    when /^the view all admins page$/
      '/staff'
    
    when /^the admin create event page$/
      '/admin/events/new'
      
    when /^the admin event page$/
      '/admin/events'
      
    when /^the resources page$/
      '/resources'
      
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
