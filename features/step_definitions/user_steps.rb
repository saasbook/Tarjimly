Given /the following requests exist/ do |requests_table|
  requests_table.hashes.each do |r|
    Request.create r
  end
end

#   Given("I am on my {string} page") do |string|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   When("I am on my {string} page") do |string|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   Then("I should see {string} and {string}") do |string, string2|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   Then("I click {string}") do |string|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   Then("I should see a list of {requests} sorted by {category}") do |requests, category|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   When("I go to the edit page for {request}") do |request|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   Then("I should see {string}") do |string|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   When("I click {string}") do |string|
#     pending # Write code here that turns the phrase above into concrete actions
#   end

#   Then("I should not see {string}") do |string|
#     pending # Write code here that turns the phrase above into concrete actions
#   end