require 'page-object'
require 'watir-webdriver'
include PageObject::PageFactory

When(/^I filter jobs by columbus$/) do
  visit_page(ManifestHome) do |page|
    page.filterByCity("Columbus, OH")
  end

end

Then(/^only columbus opportunities are present$/) do
  on_page(ManifestJobs) do |page|
    page.get_locations.each do |location|
      expect(location.text).to eq 'Columbus, OH'
    end
  end
end

When(/^I filter jobs by contract$/) do
  visit_page(ManifestHome) do |page|
    page.filterByType("Contract")
  end
end

Then(/^only contract opportunities are present$/) do
  on_page(ManifestJobs) do |page|
    page.get_types.each do |type|
      expect(type.text).to eq 'Contract'
    end
  end
end