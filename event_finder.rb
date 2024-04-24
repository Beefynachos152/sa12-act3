require 'httparty'

def fetch_events(city)
    api_key = 'PVKYO64M6J4QDBEZRUB7'
    url = "https://www.eventbriteapi.com/v3/events/search/?q=#{city}&token=#{api_key}"
    response = HTTParty.get(url)
  
    if response.success?
        events = response.parsed_response['events']
        puts "Upcoming events in #{city}:"
        events.each_with_index do |event, index|
            puts "#{index + 1}. #{event['name']['text']} - Venue: #{event['venue']['name']} - Date: #{event['start']['local']}"
        end
    else
        puts "Failed to fetch events for #{city}."
    end
end

fetch_events('Memphis')