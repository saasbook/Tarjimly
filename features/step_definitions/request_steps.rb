Given /the following requests exist/ do |requests_table|
  requests_table.hashes.each do |r|
    Request.create(r)
  end
end

Then ("I should see {string}") do |string|
  # page.should have_content(string)
  expect(page).to have_content(string)
end

Then ("I should see {string} and {string}") do |string, string1|
    page.should have_content(string) 
    page.should have_content(string1)
end

Then("I should be on {string} page") do |page_name|
  case page_name
    when  "Request"
        expect(page).to have_current_path(requests_path)
    else
      begin
        expect(page).to have_current_path("#{page_name}" + _path)
      rescue NoMethodError, ArgumentError
        raise "Can't find path for \"#{page_name}\" " 
        end
    end
end