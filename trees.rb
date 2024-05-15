require 'net/http'
require 'json'
require 'pp'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?%24limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
trees = JSON.parse(response) # Convert JSON data into Ruby data.

ash_total = 0

trees.each do |tree|
    common_name = tree['common_name']
    if common_name && common_name.include?("ash")
        ash_total += 1
    end
end

puts "Total ash trees: #{ash_total}"


