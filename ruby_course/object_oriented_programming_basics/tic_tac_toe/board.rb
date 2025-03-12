class Board
  def initialize
    @board = initial_board
  end

  def display
    puts board_in_rows.map{ |row| row.join(" | ")}.join("\n")
  end

  def move(player_symbol:, square:)
    @board[square - 1] = player_symbol
  end

  def victory?
    victory_possibilities.one? { |victory_possibility| victory_possibility.uniq.count == 1}
  end

  def self.current_player()

  end

  private

  def initial_board
    [
      1, 2, 3,
      4, 5, 6,
      7, 8, 9
    ]
  end

  def board_in_rows
    @board.each_slice(3).to_a
  end

  def victory_possibilities
    [
      @board.first(3), @board.values_at(3,4,5), @board.last(3),
      @board.values_at(0, 3, 6), @board.values_at(1, 4, 7), @board.values_at(2, 5, 8),
      @board.values_at(0,4,8), @board.values_at(2,4,6)
    ]
  end
end
