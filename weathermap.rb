require 'httparty'
require 'json'

api_key = '1cdfd239a4365005c99307086ce2ef0d'

base_url = 'https://api.openweathermap.org/data/2.5/weather'

city = 'London'

response = HTTParty.get("#{base_url}?q=#{city}&appid=#{api_key}&units=metric")

if response.code == 200
  weather_data = JSON.parse(response.body)
  temperature = weather_data['main']['temp']
  humidity = weather_data['main']['humidity']
  conditions = weather_data['weather'][0]['description']

  puts "Current weather in #{city}:"
  puts "Temperature: #{temperature}°C"
  puts "Humidity: #{humidity}%"
  puts "Conditions: #{conditions}"
else
  puts "Failed to fetch weather data: #{response.message}"
end
