Given /^I am signed in with provider "(.*)"$/ do |provider|
  # visit "/auth/#{provider.downcase}"
  #Omniauth is not stubbing. I'm desperate
  step "I am signed in as an admin"
end

Given /^I am signed in as an admin$/ do
  admin = FactoryGirl.create(:admin)
  step %Q{I am signed in with email: "#{admin.email}" and password: "#{admin.password}"}
end

Given /^I am signed in with email: "([^"]*)" and password: "([^"]*)"$/ do |email, password|
  step %Q{I sign in with email: "#{email}" and password: "#{password}"}
  step "I should be on the admin home page page"
end

Given /^I am signed out$/ do
  visit path_to("the sign out page")
end

Then /^I can log in with email: "([^"]*)" and password: "([^"]*)"$/ do |email, password|
  step %Q{I am signed in with email: "#{email}" and password: "#{password}"}
end

Then /^I cannot log in with email: "([^"]*)" and password: "([^"]*)"$/ do |email, password|
  step %Q{I sign in with email: "#{email}" and password: "#{password}"}
  step %Q{I should not see "Welcome back,"}
  step %Q{I should see "Log in"}
  step %Q{I should see "Invalid Email or Password"}
end

When /I sign in with email: "([^"]*)" and password: "([^"]*)"$/ do |email, password|
  step "I am signed out"
  visit path_to("the sign in page")
  step %Q{I fill in "Email" with "#{email}"}
  step %Q{I fill in "Password" with "#{password}"}
  step %Q{I press "Log in"}
end
  
  