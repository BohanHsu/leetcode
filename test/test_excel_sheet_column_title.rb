require 'minitest/autorun'
require '../excel_sheet_column_title'

describe 'convert_to_title' do
  it 'should return A for 1' do
    convert_to_title(1).must_equal('A')
  end

  it 'should return Z for 26' do
    convert_to_title(26).must_equal('Z')
  end

  it 'should return AB for 28' do
    convert_to_title(28).must_equal('AB')
  end

end
