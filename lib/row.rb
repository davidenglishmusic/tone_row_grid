class Row
  attr_accessor :row
  attr_reader :label

  def initialize(row, label = "P#{row.first}")
    @row = row
    @label = label
  end

  def interval_sequence
    intervals = []
    @row.each_cons(2) do |a, b|
      intervals.push(b - a)
    end
    intervals
  end
end
