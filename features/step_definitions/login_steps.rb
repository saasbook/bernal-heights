Given /^I am signed in with provider "([^"]*)"$/ do |provider|
  visit "/auth/#{provider.downcase}"
end

Given /^I am signed in$/ do
  User.create!(email: "test@test.com", password: "password", password_confirmation: "password")
  visit path_to("the sign in page")
  step "I fill in \"Email\" with \"test@test.com\""
  step "I fill in \"Password\" with \"password\""
end