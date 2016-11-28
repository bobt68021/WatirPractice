require 'page-object'
require 'watir-webdriver'

class ManifestHome
    include PageObject

    page_url 'http://manifestcorp.com/opportunities/all-opportunities/'

  def filterByCity(city)
      sleep 2
      browser.select_list(:name => 'opportunity_loc').select city
  end

  def filterByType(type)
    sleep 2
    browser.select_list(:name => 'opportunity_type').select type
  end
end