require 'minitest/autorun'
require_relative 'bubble_sort'

class BubbleSortTest < Minitest::Test
  def test_sort
    array = [4,3,78,2,0,2]
    sorted = [0,2,2,3,4,78]
    assert_equal sorted, BubbleSort.new(array:).perform 
  end
end
