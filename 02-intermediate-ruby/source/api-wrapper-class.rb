require 'httparty'

class IssPass
  ISS_PASS_TIME_URL = 'http://api.open-notify.org/iss-pass.json'
  class IssLocationError < StandardError; end

  attr_reader :time, :duration

  def initialize(time, duration)
    @time = Time.strptime(time.to_s, '%s')
    @duration = duration
  end

  def self.get_passes(latitude, longitude)
    # Build and send the request
    query = {
      lat: latitude,
      lon: longitude
    }
    response = HTTParty.get(ISS_PASS_TIME_URL, query: query)

    # Check for errors
    if response.code != 200 || response['message'] != 'success'
      raise IssLocationError, "API call failed with code #{response.code} and reason '#{response['reason']}"
    end

    # Turn the raw JSON data into instances of this class
    passes = response['response'].map do |pass|
      self.new(pass['risetime'], pass['duration'])
    end

    return passes
  end
end

# Driver code
def main
  print "Latitude: "
  latitude = gets.chomp
  print "Longitude: "
  longitude = gets.chomp

  passes = IssPass.get_passes(latitude, longitude)

  puts "The next ISS flyover is:"
  puts passes.first.time
  puts "and will last #{passes.first.duration} seconds"
end

# Run the program only if invoked directly from the command line
main if __FILE__ == $0