require 'terminal-table'

class TemperatureFormatter

  def self.format(temperatures)
    table = Terminal::Table.new :rows => temperatures, :headings => %w(City °C)
    table.align_column(1, :right)

    table
  end

end
