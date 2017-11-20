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

  describe '#inverse' do
    it 'returns the inverse of a row' do
      row = Row.new([1, 0, 5, 7, 9, 8, 4, 11, 2, 10, 6, 3])
      expect(RowComposer.inverse(row).row).to eql [1, 2, 9, 7, 5, 6, 10, 3, 0, 4, 8, 11]
    end
  end

  describe '#retrograde_inverse' do
    it 'returns the retrograde inverse of a row' do
      row = Row.new([1, 2, 9, 7, 5, 6, 10, 3, 0, 4, 8, 11])
      expect(RowComposer.retrograde_inverse(row).row).to eql [3, 6, 10, 2, 11, 4, 8, 9, 7, 5, 0, 1]
    end
  end
end
