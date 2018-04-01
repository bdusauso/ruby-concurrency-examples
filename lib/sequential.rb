require "benchmark"

require_relative "./temperature_fetcher.rb"
require_relative "./temperature_formatter.rb"
require_relative "./cities.rb"

# Just so 'temperatures' exists and is not nil
temperatures = []

time = Benchmark.measure do
  temperatures = CITIES.map do |city|
    TemperatureFetcher.new(city).fetch
  end
end

puts TemperatureFormatter.format(temperatures)
puts "\nTime: #{time}"
