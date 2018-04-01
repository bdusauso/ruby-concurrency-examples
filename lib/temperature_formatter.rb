require 'terminal-table'

class TemperatureFormatter

  def self.format(temperatures)
    Terminal::Table.new :rows => temperatures
  end

end
