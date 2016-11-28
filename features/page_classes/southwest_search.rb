require 'watir-webdriver'
require 'page-object'
require 'date'

class SouthwestSearch
  include PageObject

  div(:results, class: 'calendarCarousel')
  li(:highlighted_depart, :id => 'carouselTodayDepart')
  li(:highlighted_return, :id => 'carouselTodayReturn')

  def get_highlighted_days
    highlighted_days = [highlighted_depart_element.attribute('carouselfulldate'), highlighted_return_element.attribute('carouselfulldate')]
  end

  def get_dates
    current_year = Date.today.year
    unavailable_dates = Array.new
    available_dates = Array.new
    results_element.list_item_elements.each do |date|
      if date.text.include?("not available")
        unavailable_dates << Date.parse(current_year.to_s + "-" + get_month(date) + "-" + get_day(date))
      else
        available_dates << Date.parse(current_year.to_s + "-" + get_month(date) + "-" + get_day(date))
      end
    end
    all_dates = [unavailable_dates, available_dates]
  end

  def get_day (date)
    date.div_element(:class => 'carouselBody').text
  end

  def get_month (date)
    month_values = Hash.new

    month_values['JAN']=1
    month_values['FEB']=2
    month_values['MAR']=3
    month_values['APR']=4
    month_values['MAY']=5
    month_values['JUN']=6
    month_values['JUL']=7
    month_values['AUG']=8
    month_values['SEP']=9
    month_values['OCT']=10
    month_values['NOV']=11
    month_values['DEC']=12

    month_values[date.div_element(:class => 'carouselHeader').text].to_s
  end

end