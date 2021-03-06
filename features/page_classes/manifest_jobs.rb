require 'page-object'
require 'watir-webdriver'

class ManifestJobs
  include PageObject

  divs(:location_results, class: 'opp-loc')
  divs(:type_results, class: 'opp-type')

  def get_locations
    return location_results_elements
  end

  def get_types
    return type_results_elements
  end

end