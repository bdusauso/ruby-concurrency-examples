require 'terminal-table'

class TemperatureOutputter

  def self.print(temperatures)
    table = Terminal::Table.new :rows => temperatures
  end

end
