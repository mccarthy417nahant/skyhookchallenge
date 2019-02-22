require 'rubygems'
require 'httparty'
require 'pry'

class PrecisionLocation
  include HTTParty
  base_uri "https://global.skyhookwireless.com"
  format :xml


  def location()
    response = self.class.post('/wps2/location',
      :read_timeout => 1000,
      :headers => {
        "Content-Type" => "text/xml"
      },
      :body => "<LocationRQ xmlns=\"http://skyhookwireless.com/wps/2005\" version=\"2.26\" street-address-lookup=\"full\"><authentication version=\"2.2\"><key key=\"eJwz5DQ0AAELM3NTzmpXQyMnR1dLY11zEzNHXVcXE1ddIM9S19HN3MnQyM3N0tXVtRYAF1ELjA\" username=\"C02W503XG8WN\" /></authentication>
        <access-point><mac>6C96CFE0303D</mac><ssid>Lucy's House</ssid><signal-strength>-36</signal-strength></access-point>
      </LocationRQ>")
    require "pry"
    binding.pry
    response
  end
end

precision_location = PrecisionLocation.new

  i=0

  loop do
    i += 1
    puts precision_location.location
    sleep(10)
    if i == 5
      break
    end
  end
