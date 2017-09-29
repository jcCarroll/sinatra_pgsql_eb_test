require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class SelTestCase < Test::Unit::TestCase

  def setup
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: [ "--headless" ]})
    @driver = Selenium::WebDriver.for:chrome, desired_capabilities:caps
    @driver.navigate.to("http://devenv.j8fpymzrg5.us-west-2.elasticbeanstalk.com/")
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  end  

  def teardown
    @driver.close
  end

  def test_correct_url
    assert @wait.until { @driver.current_url == "http://devenv.j8fpymzrg5.us-west-2.elasticbeanstalk.com/" }
  end

  def test_name_fields
    # First Name Label
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[1]/td[1]/label').displayed? == true }
    # First Name Input
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[1]/td[2]/input').displayed? == true }
    # Last Name Label
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[2]/td[1]/label').displayed? == true }
    # Last Name Input
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[2]/td[2]/input').displayed? == true }
  end

end