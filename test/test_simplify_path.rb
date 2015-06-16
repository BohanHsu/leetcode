require 'minitest/autorun'
require '../simplify_path'

describe 'simplify_path' do
  it 'should pass test1' do
    path = '/home/'
    simplify_path(path).must_equal('/home')
  end

  it 'should pass test2' do
    path = '/a/./b/../../c/'
    simplify_path(path).must_equal('/c')
  end

  it 'should pass test3' do
    path = '/../'
    simplify_path(path).must_equal('/')
  end

  it 'should pass test4' do
    path = '/home//foo/'
    simplify_path(path).must_equal('/home/foo')
  end
end
