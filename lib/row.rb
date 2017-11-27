class Row
  attr_accessor :row
  attr_reader :type

  def initialize(row, type = :p)
    @row = row
    @type = type
  end

  def label
    pitch = @type == :p || @type == :i ? row.first : row.last
    @type.to_s + pitch.to_s
  end

  def interval_sequence
    intervals = []
    @row.each_cons(2) do |a, b|
      intervals.push(b - a)
    end
    intervals
  end
end
