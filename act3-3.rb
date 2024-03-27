require 'httparty'

def find_events(api_key, location)
  url = "https://www.eventbriteapi.com/v3/events/search/?location.address=#{location}&token=#{api_key}"
  response = HTTParty.get(url)
  events_data = JSON.parse(response.body)
  events = events_data['events']
  events
end

# Example usage:
api_key = 'your_api_key'
location = 'New York'
events = find_events(api_key, location)
events.each do |event|
  puts "Name: #{event['name']['text']}"
  puts "Venue: #{event['venue']['name']}"
  puts "Date: #{event['start']['local']}"
  puts "Time: #{event['start']['time']}"
  puts "------------------------"
end