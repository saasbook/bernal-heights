Given /^I am signed in with provider "([^"]*)"$/ do |provider|
  visit "/auth/#{provider.downcase}"
end

Given /^I am signed in(?:| as a non-admin)$/ do
  user = FactoryGirl.create(:user)
  visit path_to("the sign in page")
  step %Q{I fill in "Email" with "#{user.email}"}
  step %Q{I fill in "Password" with "#{user.password}"}
  step %Q{I press "Log in"}
  step "I should be on the events page"
end

Given /^I am signed in as an admin$/ do
  admin = FactoryGirl.create(:admin)
  visit path_to("the sign in page")
  step %Q{I fill in "Email" with "#{admin.email}"}
  step %Q{I fill in "Password" with "#{admin.password}"}
  step %Q{I press "Log in"}
  step "I should be on the admin dashboard page"
end

Given /^I am signed out$/ do
  visit path_to("the sign out page")
end
  
  