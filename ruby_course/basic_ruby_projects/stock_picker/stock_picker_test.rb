require 'minitest/autorun'
require_relative 'stock_picker'

class StockPickerTest < Minitest::Test
  def test_profit
    stock_prices = [17,3,6,9,15,8,6,1,10]
    pair = [1,4]
    assert_equal pair, StockPicker.new(stock_prices:).perform 
  end
end
