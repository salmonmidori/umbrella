require "dotenv/load"
require "http"
require "json"
require "date"

puts "========================================
    Will you need an umbrella today?
========================================

Where are you?
"
user_location = gets.chomp
gmaps_key = ENV["GMAPS_KEY"]
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"
gmaps_resp = HTTP.get(gmaps_url).to_s
gmaps_parsed_resp = JSON.parse(gmaps_resp)
def coordinates(parsed_resp, type)
  parsed_resp.dig("results", 0, "geometry", "location", type)
end
lng = coordinates(gmaps_parsed_resp, "lng")
lat = coordinates(gmaps_parsed_resp, "lat")

pirate_weather_key = ENV["PIRATE_WEATHER_KEY"]
pirate_weather_url = "https://api.pirateweather.net/forecast/#{pirate_weather_key}/#{lat},#{lng}"
pirate_weather_resp = HTTP.get(pirate_weather_url).to_s
pirate_weather_parsed_resp = JSON.parse(pirate_weather_resp)

temp = pirate_weather_parsed_resp["currently"]["temperature"]
weather = pirate_weather_parsed_resp.dig("hourly", "data", 0, "summary")

def rain_prob(parsed_resp, hour_num)
  parsed_resp.dig("hourly", "data", hour_num, "precipProbability")
end


if rain_prob(pirate_weather_parsed_resp, 0) < 0.1 && rain_prob(pirate_weather_parsed_resp, 1) < 0.05 && rain_prob(pirate_weather_parsed_resp, 2) < 0.05
  rain_text = "You probably won't need an umbrella."
else
  rain_text = "You might want to take an umbrella!"
end

puts "Checking the weather at #{user_location}....
Your coordinates are #{lat}, #{lng}.
It is currently #{temp}°F and the weather is #{weather.downcase}. There is a #{rain_prob(pirate_weather_parsed_resp, 0) * 100}% chance of precipitation.
In 1 hour, there is a #{rain_prob(pirate_weather_parsed_resp, 1) * 100}% chance of precipitation.
In 2 hours, there is a #{rain_prob(pirate_weather_parsed_resp, 2) * 100}% chance of precipitation.
" + rain_text



# If you get that far, then stretch further:


  
    
#   For each of the next twelve hours, check if the precipitation probability is greater than 10%.
    
      
        
#       If so, print a message saying how many hours from now and what the precipitation probability is.
        
      
    
  
    
  
  
    
#       If any of the next twelve hours has a precipitation probability greater than 10%, print “You might want to carry an umbrella!”

#     If not, print “You probably won’t need an umbrella today.”
