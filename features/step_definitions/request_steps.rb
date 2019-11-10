Given /the following requests exist/ do |requests_table|
  requests_table.hashes.each do |r|
    Request.create(r)
  end
end

  # # Given("I go to my {string} page") do |string|
  # #   visit path_to(string)
  # # end

  # When("I go to my {string} page") do |string|
  #   visit path_to(string)
  # end

  Then ("I should see {string} and {string}") do |string, string1|
    page.should have_content(string) 
    page.should have_content(string1)
  end

  # # Then("I should see {string} before {second}") do |string, string1|
  #   page.body.index(string) < page.body.index(string1)
  # end

  # Then("I click {string}") do |string|
  #   click_button(string)
  # end

  # Then("I should see a list of {string} sorted by {string1}") do |string, string1|

  #   pending # Write code here that turns the phrase above into concrete actions

  # end

  # When("I go to the edit page for {string}") do |string|

  #   pending # Write code here that turns the phrase above into concrete actions

  # end

  # Then("I should (not)? see {string}") do |should, string|

  #   pending # Write code here that turns the phrase above into concrete actions

  # end