class Row
  attr_accessor :row

  def initialize(row)
    @row = row
  end

  def interval_sequence
    intervals = []
    @row.each_cons(2) do |a, b|
      intervals.push(b - a)
    end
    intervals
  end
end
