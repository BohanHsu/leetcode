require 'minitest/autorun'
require '../excel_sheet_column_number'

describe 'title_to_number' do
  it 'should return 1 for A' do
    title_to_number('A').must_equal(1)
  end

  it 'should return 28 for AB' do
    title_to_number('AB').must_equal(28)
  end
end
