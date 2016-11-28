require "watir-webdriver"
require "page-object"

class SouthwestHome
  include PageObject

  page_url "https://www.southwest.com/"

  text_field(:arrival_input, :name => 'originAirport')
  text_field(:departure_input, :name => 'destinationAirport')

  def searchFlights(arrival, departure)
    self.arrival_input = arrival
    self.departure_input = departure

    sleep 2
    browser.button(:id => 'jb-booking-form-submit-button').click
  end


end