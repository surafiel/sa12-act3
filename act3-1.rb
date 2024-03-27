require 'httparty'

def fetch_weather_data(api_key, city)
  url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}"
  response = HTTParty.get(url)
  weather_data = JSON.parse(response.body)
  weather_data
end

def calculate_average_temperature(weather_data, period)
  temperatures = []
  period.times do
    temperatures << weather_data['main']['temp']
    sleep(3600) # Wait for an hour
  end
  average_temperature = temperatures.sum / temperatures.length
  average_temperature
end

# Example usage:
api_key = 'your_api_key'
city = 'London'
weather_data = fetch_weather_data(api_key, city)
average_temperature = calculate_average_temperature(weather_data, 24)
puts "Average temperature in #{city} over 24 hours: #{average_temperature} Kelvin"