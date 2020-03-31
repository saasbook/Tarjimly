require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given("I am signed in as a translator") do 
  visit path_to("Home")
  fill_in("email", with: "cassidyhardin@berkeley.edu")
  fill_in("password", with: "tarjimlydocs19")
  click_button("Login")
end

Given("I am signed in as a user") do 
  visit path_to("Home")
  fill_in("email", with: "cassihardin@gmail.com")
  fill_in("password", with: "tarjimlydocs19")
  click_button("Login")
end


Given("I go to the {string} page") do |string|
    visit path_to(string)
  end

  Given("I am on the {string} page") do |string|
    visit path_to(string)
  end

  Then("I should be on the {string} page") do |string|

    page.current_path.equal? (path_to(string))
  end

  Given("I go to the {string} page for request id {string}") do |string, string2|
    visit path_to(string, string2)
  end

When ("I click the {string} button") do |string|
    click_button(string)
end 

When ("I select {string}") do |link|
  click_link(link)
end

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, with: value)
end

# When("I fill in datefield {string} with {string}") do |field, value|
#   fill_in(field, with: "))
# end

When("I fill in {string} with {string} and {string} with {string}") do |string, string2, string3, string4|
  fill_in string, with: string2
  fill_in string3, with: string4
end

When("I select {string} from {string}") do |value, field|
  select(value, from: field)
end

When("I check {string}") do |field|
  check(field)
end

When("I refesh the page") do
  visit current_path 
end


