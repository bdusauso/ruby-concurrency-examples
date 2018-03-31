require "benchmark"

require_relative "./temperature_fetcher.rb"
require_relative "./cities.rb"

time = Benchmark.measure do
  temperatures = CITIES.map do |city|
    TemperatureFetcher.new(city).fetch
  end

  temperatures.each do |temp|
    puts "#{temp.first}: #{temp.last}"
  end
end

puts "\nTime: #{time}"
