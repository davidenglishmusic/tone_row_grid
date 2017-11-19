tones = [
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
]

primary_row = tones.shuffle.map { |tone| tone[0] }

intervals = []
primary_row.each_cons(2) do |a, b|
  intervals.push(b - a)
end

direct_inversion = [primary_row.first]

next_note = primary_row.first
intervals.each do |interval|
  next_note -= interval
  next_note += 12 if next_note.negative?
  next_note -= 12 if next_note >= 12
  direct_inversion.push(next_note)
end

rows = []
direct_inversion.each do |pitch|
  next_note = pitch
  row = [pitch]
  intervals.each do |interval|
    next_note += interval
    next_note += 12 if next_note.negative?
    next_note -= 12 if next_note >= 12
    row.push(next_note)
  end
  rows.push(row)
end

rows.each { |row| p row }
