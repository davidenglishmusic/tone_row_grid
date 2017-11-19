require 'row_composer'

RSpec.describe RowComposer do
  describe '#generate_random_row' do
    it 'returns the interval sequence' do
      row = RowComposer.generate_random_row
      expect(row.is_a?(Row)).to be true
    end
  end

  describe '#retrograde' do
    it 'returns the retrograde of a row' do
      row = Row.new([7, 11, 3, 2, 6, 9, 8, 1, 10, 5, 4, 0])
      expect(RowComposer.retrograde(row).row).to eql [0, 4, 5, 10, 1, 8, 9, 6, 2, 3, 11, 7]
    end
  end
end
