require "rest-client"
require "json"

class TemperatureFetcher

  API_KEY  = "ce58792015f3118e4da9a8f26a318498"
  BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

  DEFAULT_PARAMS = {
    units: :metric,
    APPID: API_KEY
  }

  def initialize(city)
    super()
    @city = city
  end

  def fetch
    begin
      response = RestClient.get(BASE_URL, params: DEFAULT_PARAMS.merge({ q: @city }))
    rescue RestClient::NotFound
      puts "No data found for #{city}"
    else
      content     = JSON.parse(response.body)
      temperature = content["main"]["temp"].to_i

      [@city, temperature]
    end
  end

end
