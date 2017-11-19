require 'row_composer'

RSpec.describe RowComposer, '#generate_random_row' do
  it 'returns the interval sequence' do
    row = RowComposer.generate_random_row
    expect(row.is_a?(Row)).to be true
  end
end
