require "concurrent"
require "benchmark"

require_relative "./temperature_fetcher.rb"
require_relative "./cities.rb"


time = Benchmark.measure do
  future_temps = CITIES.map do |city|
    Concurrent::Future.execute { TemperatureFetcher.new(city).fetch }
  end

  until future_temps.all?(&:fulfilled?) do
    sleep(0.05)
  end

  future_temps.each do |ft|
    value = ft.value
    puts "#{value.first}: #{value.last}"
  end
end

puts "\nTime: #{time}"
