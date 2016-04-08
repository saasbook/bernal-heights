Given /the following admins exist/ do |admin_table|
  admin_table.hashes.each do |admin|
    new_admin = Admin.create!(admin)
  end
end

When /^I provide old password "([^"]*)" to update my password to "([^"]*)"$/ do |old_password, new_password|
  visit path_to("the edit account info page")
  step %Q{I fill in "Password" with "#{new_password}"}
  step %Q{I fill in "Password confirmation" with "#{new_password}"}
  step %Q{I fill in "Current password" with "#{old_password}"}
  step %Q{I press "Update"}
end

When /^I update my name to "([^"]*)"$/ do |name|
  visit path_to("the edit account info page")
  step %Q{I fill in "Name" with "#{name}"}
  step %Q{I press "Update"}
end

When /^I update my email to "([^"]*)"$/ do |email|
  visit path_to("the edit account info page")
  step %Q{I fill in "Email" with "#{email}"}
  step %Q{I press "Update"}
end

