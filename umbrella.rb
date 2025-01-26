require "dotenv/load"
require "http"
require "json"
require "date"

puts "========================================
    Will you need an umbrella today?
========================================

Where are you?
"
# user_location = gets.chomp
# user_location = "Chicago"
# gmaps_key = ENV["GMAPS_KEY"]
# gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"
# lon = 41.8887
# lat = -87.6297982

# pirate_weather_key = ENV["PIRATE_WEATHER_KEY"]
# pirate_weather_url = "https://api.pirateweather.net/forecast/#{pirate_weather_key}/#{lon},#{lat}"
# pirate_weather_resp = HTTP.get(pirate_weather_url).to_s
# pirate_weather_parsed_resp = JSON.parse(pirate_weather_resp)
# temp = pirate_weather_parsed_resp["currently"]["temperature"]
# weather = pirate_weather_parsed_resp["currently"]["summary"]
pp Time.at(1737851280)
BREAK

rain0 = 53
rain1 = 37
rain2 = 18

if weather == "Clear"
  rain_text = "You probably won't need an umbrella."
else
  rain_text = "In 0 hours, there is a #{rain0}% chance of precipitation.\nIn 1 hours, there is a #{rain1}% chance of precipitation.\nIn 2 hours, there is a #{rain2}% chance of precipitation.\nYou might want to take an umbrella!"
end

puts "Checking the weather at #{user_location}....
Your coordinates are #{longitude}, #{latitude}.
It is currently #{temp}°F.
Next hour: #{weather}
" + rain_text

# Ask the user for their location. (Recall gets.)
   
#   Get and store the user’s location.
    
#   Get the user’s latitude and longitude from the Google Maps API.
    
#   Get the weather at the user’s coordinates from the Pirate Weather API.
    
#   Display the current temperature and summary of the weather for the next hour.
    
  


# If you get that far, then stretch further:


  
    
#   For each of the next twelve hours, check if the precipitation probability is greater than 10%.
    
      
        
#       If so, print a message saying how many hours from now and what the precipitation probability is.
        
      
    
  
    
  
  
    
#       If any of the next twelve hours has a precipitation probability greater than 10%, print “You might want to carry an umbrella!”

#     If not, print “You probably won’t need an umbrella today.”
