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
    Row.new(row.row.reverse, :r)
  end

  def self.inverse(row)
    inversed_row = [row.row.first]
    next_note = row.row.first
    row.interval_sequence.each do |interval|
      next_note -= interval
      next_note += 12 if next_note.negative?
      next_note -= 12 if next_note >= 12
      inversed_row.push(next_note)
    end
    Row.new(inversed_row, :i)
  end

  def self.retrograde_inverse(row)
    Row.new(retrograde(inverse(row)).row, :ri)
  end

  def self.transpose(row, starting_pitch)
    transposed_row = [starting_pitch]
    next_note = starting_pitch
    row.interval_sequence.each do |interval|
      next_note += interval
      next_note += 12 if next_note.negative?
      next_note -= 12 if next_note >= 12
      transposed_row.push(next_note)
    end
    Row.new(transposed_row, row.type)
  end

  def self.generate_all_combinations(row)
    primes = inverse(row).row.map { |pitch| transpose(row, pitch) }

    all_combinations = [primes]
    all_combinations.push(primes.map { |prime| retrograde(prime) })
    all_combinations.push(primes.map { |prime| inverse(prime) })
    all_combinations.push(primes.map { |prime| retrograde_inverse(prime) })

    all_combinations.flatten
  end
end
