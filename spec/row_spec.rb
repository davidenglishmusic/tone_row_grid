require 'row'

RSpec.describe Row do
  describe '#interval_sequence' do
    it 'returns the interval sequence' do
      row = Row.new([7, 4, 2, 5, 8, 0, 9, 3, 11, 6, 10, 1])
      expect(row.interval_sequence).to eql([-3, -2, 3, 3, -8, 9, -6, 8, -5, 4, -9])
    end
  end

  describe 'initialization' do
    it 'creates a default label when none is provided' do
      row = Row.new([0, 3, 11, 9, 7, 10, 8, 1, 2, 4, 6, 5])
      expect(row.label).to eql 'p0'
    end
  end
end
