class Player
  attr_reader :number, :first_name, :symbol

  def initialize(number:, first_name:, symbol:)
    @number = number
    @first_name = first_name
    @symbol = symbol
  end
end
