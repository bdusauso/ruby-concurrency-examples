require "rest-client"
require "concurrent"
require "benchmark"
require "json"

API_KEY  = "ce58792015f3118e4da9a8f26a318498"
BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

DEFAULT_PARAMS = {
  units: :metric,
  APPID: API_KEY
}

CITIES = %w(
  Brussels
  Paris
  London
  Berlin
  Stockholm
  Madrid
  Tirana
  Yerevan
  Vienna
  Baku
  Bucharest
)

time = Benchmark.measure do
  CITIES.each do |city|
    begin
      response = RestClient.get(BASE_URL, params: DEFAULT_PARAMS.merge({q: city}))
    rescue RestClient::NotFound => err
      puts "No data found for #{city}"
    else
      content = JSON.parse(response.body)
      temp    = content["main"]["temp"]
      
      puts "#{city}: #{temp}" 
    end
  end
end

puts "\nTime: #{time}"