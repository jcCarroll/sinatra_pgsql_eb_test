require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class SelTestCase < Test::Unit::TestCase
    
      def setup
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: [ "--headless" ]})
        @driver = Selenium::WebDriver.for:chrome, desired_capabilities:caps
        @driver.navigate.to("http://simple-app.aeye977yjr.us-west-2.elasticbeanstalk.com/")
        @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      end  
    
      def teardown
        @driver.close
      end

      def test_correct_url
        actualURL = @driver.current_url
        assert_equal("http://simple-app.aeye977yjr.us-west-2.elasticbeanstalk.com/", actualURL, "URL Did not match")
      end

end