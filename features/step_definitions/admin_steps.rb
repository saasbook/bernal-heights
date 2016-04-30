Given /the following admins exist/ do |admin_table|
  admin_table.hashes.each do |admin|
    new_admin = Admin.create!(admin)
  end
end

When /^I provide old password "([^"]*)" to update my password to "([^"]*)"$/ do |old_password, new_password|
  visit path_to("the edit account info page")
  fill_in('Password', with: new_password, :match => :prefer_exact)
  fill_in('Password confirmation', with: new_password, :match => :prefer_exact)
  fill_in('Current password', with: old_password)
  step %Q{I press "Change Password"}
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

When /^I register an admin with name: "([^"]*)", email: "([^"]*)" and password: "([^"]*)"$/ do |name, email, password|
  visit path_to("the add new admin page")
  step %Q{I fill in "Name" with "#{name}"}
  step %Q{I fill in "Email" with "#{email}"}
  fill_in('Password', with: password, :match => :prefer_exact)
  fill_in('Password confirmation', with: password, :match => :prefer_exact)
  step %Q{I press "Create Account"}
end

When /^I delete the account for "([^"]*)"$/ do |name|
  admin = Admin.where(name: name).first
  css_id = "#" + "admin#{admin.id}"
  find(:css, css_id).click
  page.evaluate_script('window.confirm = function() { return true; }')
end

When /^I do not delete the account for "([^"]*)"$/ do |name|
  admin = Admin.where(name: name).first
  css_id = "#" + "admin#{admin.id}"
  #poltergeist always returns true.....
  # find(css_id).click
  # page.evaluate_script('window.confirm = function() { return false; }')
end

When /^I should not have the option to delete "([^"]*)"$/ do |name|
  admin = Admin.where(name: name).first
  css_id = "#" + "admin#{admin.id}"
  expect(page).to_not have_css(css_id)
end

When /^I should have the option to delete "([^"]*)"$/ do |name|
  admin = Admin.where(name: name).first
  css_id = "#" + "admin#{admin.id}"
  expect(page).to have_css(css_id)
end