require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class SelTestCase < Test::Unit::TestCase

  def setup
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: [ "--headless" ]})
    @driver = Selenium::WebDriver.for:chrome
    # , desired_capabilities:caps
    @driver.navigate.to("http://devenv.j8fpymzrg5.us-west-2.elasticbeanstalk.com/")
    @wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  end  

  def teardown
    sleep 3
    @driver.close
  end

  def test_correct_url
    assert @wait.until { @driver.current_url == "http://devenv.j8fpymzrg5.us-west-2.elasticbeanstalk.com/" }
  end

  def test_name_fields
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[1]/td[1]/label').displayed? == true }
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[1]/td[2]/input').displayed? == true }
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[2]/td[1]/label').displayed? == true }
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[2]/td[2]/input').displayed? == true }
  end

  def test_submit_form
    assert @wait.until { @driver.find_element(:xpath, '/html/body/form/input').displayed? == true }
  end

  def test_input_names_submit
    @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[1]/td[2]/input').send_keys('Jacob')
    @driver.find_element(:xpath, '/html/body/form/table/tbody/tr[2]/td[2]/input').send_keys('Carroll')
    @driver.find_element(:xpath, '/html/body/form/input').click()
  end

end