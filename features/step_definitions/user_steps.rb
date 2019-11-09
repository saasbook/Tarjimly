Given /the following requests exist/ do |requests_table|
  requests_table.hashes.each do |r|
    Request.create r
  end
end

  Given("I go to my {page} page") do |page|
    visit path_to(page)
  end

  # When("I go to my {string} page") do |string|
  #   visit path_to(page)
  # end

  # Then("I should see {string} and {string}") do |first, second|
  #   page.should have_content(first) & page.should have_content(second)
  # end

  # Then("I should see {first} before {second}") do |first, second|
  #   page.body.index(first) < page.body.index(second)
  # end

  # Then("I click {button}") do |button|
  #   click_button(button)
  # end

  # Then("I should see a list of {requests} sorted by {category}") do |requests, category|

  #   pending # Write code here that turns the phrase above into concrete actions

  # end

  # When("I go to the edit page for {request}") do |request|

  #   pending # Write code here that turns the phrase above into concrete actions

  # end

  # Then("I should (not)? see {request}") do |should, request|

  #   pending # Write code here that turns the phrase above into concrete actions

  # end