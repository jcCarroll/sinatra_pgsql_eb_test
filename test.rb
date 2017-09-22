require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class LoginTestCase < Test::Unit::TestCase
    
      def setup
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: [ "--headless" ]})
        @driver = Selenium::WebDriver.for:chrome, desired_capabilities:caps
        @driver.navigate.to("http://simple-app.aeye977yjr.us-west-2.elasticbeanstalk.com/")
        @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      end  
    
      def teardown
        @driver.close
      end

end