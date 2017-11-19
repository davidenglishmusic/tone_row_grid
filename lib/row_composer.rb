require_relative 'row'

class RowComposer
  TONES = [
    [0, 'c'],
    [1, 'c#'],
    [2, 'd'],
    [3, 'eb'],
    [4, 'e'],
    [5, 'f'],
    [6, 'f#'],
    [7, 'g'],
    [8, 'ab'],
    [9, 'a'],
    [10, 'bb'],
    [11, 'b']
  ].freeze

  def self.generate_random_row
    Row.new(TONES.shuffle.map { |tone| tone[0] })
  end

  def self.retrograde(row)
    Row.new(row.row.reverse)
  end
end
