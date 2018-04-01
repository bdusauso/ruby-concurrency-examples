require "concurrent"
require "benchmark"

require_relative "./temperature_fetcher.rb"
require_relative "./temperature_formatter.rb"
require_relative "./cities.rb"

# Just so 'temperatures' exists and is not nil
temperatures = []

time = Benchmark.measure do
  temperatures = CITIES.map do |city|
    Concurrent::Future.execute { TemperatureFetcher.new(city).fetch }
  end

  until temperatures.all?(&:fulfilled?) do
    sleep(0.05)
  end
end

puts TemperatureFormatter.format(temperatures.map(&:value))
puts "\nTime: #{time}"
