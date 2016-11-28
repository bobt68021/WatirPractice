require 'watir-webdriver'

Before do
    @browser = Watir::Browser.new :chrome
end

After do
    sleep 5
    @browser.close
end