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
    Row.new(row.row.reverse, "R#{row.row.first}")
  end

  def self.inverse(row)
    inverse = [row.row.first]

    next_note = row.row.first
    row.interval_sequence.each do |interval|
      next_note -= interval
      next_note += 12 if next_note.negative?
      next_note -= 12 if next_note >= 12
      inverse.push(next_note)
    end
    Row.new(inverse, "I#{row.row.first}")
  end

  def self.retrograde_inverse(row)
    Row.new(retrograde(inverse(row)).row, "RI#{row.row.first}")
  end
end
