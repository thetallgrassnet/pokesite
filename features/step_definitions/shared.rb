When(/^I visit the (.*) path$/) do |route|
  visit eval(route.tr(' ', '_') + '_path')
end

When(/^I click "([^"]*)"$/) do |arg|
  click_on arg
end
