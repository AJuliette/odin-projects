require 'pry'

class StockPicker
  attr_accessor :stock_prices

  def initialize(stock_prices:)
    @stock_prices = stock_prices
  end

  def perform
    best_pair = []
    best_price = 0
    @stock_prices.each_with_index do |price, day_index|
      next if day_index == 0
      (0..day_index).to_a.each do |prior_day_index|
        next if prior_day_index == day_index
        if price - @stock_prices[prior_day_index] > best_price
          best_price = price - @stock_prices[prior_day_index]
          best_pair = [prior_day_index, day_index]
        end
      end
    end

    best_pair
  end
end
