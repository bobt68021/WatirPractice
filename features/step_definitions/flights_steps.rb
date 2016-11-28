require 'page-object'
require 'watir-webdriver'
require 'date'
include PageObject::PageFactory

When(/^I search for a flight using the default dates$/) do
  visit_page(SouthwestHome) do |page|
    sleep 1
    page.searchFlights('CLE', 'FLL')
    sleep 2
  end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  departTime = Time.new + 60*60*24
  returnTime = Time.new + 60*60*96
  on_page(SouthwestSearch) do |page|
    highlighted_days = page.get_highlighted_days
    expect(highlighted_days[0]).to eq departTime.strftime('%Y/%m/%d')
    expect(highlighted_days[1]).to eq returnTime.strftime('%Y/%m/%d')
  end
end

And(/^I can’t choose a departure date from the past$/) do
  available = false
  on_page(SouthwestSearch) do |page|
    page.get_dates.each do |temp_date_array|
      temp_date_array.each do |temp_date|
        if(!available)
          expect(temp_date).to  be < Date.today
        else
          expect(temp_date).to  be >= Date.today
        end
      end
      available = true
    end
  end
end
