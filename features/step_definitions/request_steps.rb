Given /the following requests exist/ do |requests_table|
  requests_table.hashes.each do |r|
    Request.create(r)
  end
end

Then ("I should see {string}") do |string|
  page.should have_content(string) 
end

Then ("I should see {string} and {string}") do |string, string1|
    page.should have_content(string) 
    page.should have_content(string1)
end