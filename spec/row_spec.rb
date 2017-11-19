require 'row'

RSpec.describe Row, '#interval_sequence' do
  it 'returns the interval sequence' do
    row = Row.new([7, 4, 2, 5, 8, 0, 9, 3, 11, 6, 10, 1])
    expect(row.interval_sequence).to eql([-3, -2, 3, 3, -8, 9, -6, 8, -5, 4, -9])
  end
end
