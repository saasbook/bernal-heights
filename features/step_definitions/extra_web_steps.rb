When /^I cancel the confirm dialogue for "([^"]*)"$/ do |link|
   # waiting on fix for poltergeist always returning true. Just...not clicking for now haha
    # click_link(link)
    # page.evaluate_script('window.confirm = function() { return false; }')
end

When /^I accept the confirm dialogue for "([^"]*)"$/ do |link|
  click_link(link)
  page.evaluate_script('window.confirm = function() { return true; }')
end