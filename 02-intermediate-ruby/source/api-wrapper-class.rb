require 'httparty'

class IssLocation
  ISS_PASS_TIME_URL = 'http://api.open-notify.org/iss-pass.json'
  class IssLocationError < StandardError; end

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def get_passes
    # Build and send the request
    query = {
      lat: @latitude,
      lon: @longitude
    }
    response = HTTParty.get(ISS_PASS_TIME_URL, query: query)

    # Check for errors
    if response.code != 200 || response['message'] != 'success'
      raise IssLocationError, "API call failed with code #{response.code} and reason '#{response['reason']}"
    end

    # Pull out and format the data we're interested in
    passes = response['response'].map do |pass|
      {
        time: Time.strptime(pass['risetime'].to_s, '%s'),
        duration: pass['duration']
      }
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

  location = IssLocation.new(latitude, longitude)
  passes = location.get_passes

  puts "The next ISS flyover is:"
  puts passes.first[:time]
  puts "and will last #{passes.first[:duration]} seconds"
end

# Run the program only if invoked directly from the command line
main if __FILE__ == $0