Given /^I am signed in as an admin$/ do
  admin = FactoryGirl.create(:admin, admin: true)
  step %Q{I am signed in with email: "#{admin.email}" and password: "#{admin.password}"}
end

Given /^I am signed in with email: "([^"]*)" and password: "([^"]*)"$/ do |email, password|
  step %Q{I sign in with email: "#{email}" and password: "#{password}"}
  step "I should be on the admin home page"
end

When /^I sign in as an admin named "([^"]*)"$/ do |name|
  admin = Admin.where(name: name).first
  step %Q{I sign in with email: "#{admin.email}" and password: "12345678"}
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
  step %Q{I should see "Invalid email or password"}
end

When /I sign in with email: "([^"]*)" and password: "([^"]*)"$/ do |email, password|
  step "I am signed out"
  visit path_to("the sign in page")
  step %Q{I fill in "Email" with "#{email}"}
  step %Q{I fill in "Password" with "#{password}"}
  step %Q{I press "Log in"}
end
  
  