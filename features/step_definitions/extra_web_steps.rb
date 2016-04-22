When /^I cancel the confirm dialogue for "([^"]*)"$/ do |link|
  accept_confirm do
    click_link(link)
  end
end

When /^I accept the confirm dialogue "([^"]*)"$/ do |link|
  dismiss_confirm do
    click_link(link)
  end
end