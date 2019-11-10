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


Given("I go to my {string} page") do |string|
    visit path_to(string)
  end

#   When /^(?:|I )go to (.+)?/ do |page_name|
#     visit path_to(page_name)
#   end