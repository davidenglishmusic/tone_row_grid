require_relative 'lib/row_composer'

seed = RowComposer.generate_random_row

intervals = []
seed.row.each_cons(2) do |a, b|
  intervals.push(b - a)
end

direct_inversion = RowComposer.inverse(seed)

rows = []
direct_inversion.row.each do |pitch|
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
