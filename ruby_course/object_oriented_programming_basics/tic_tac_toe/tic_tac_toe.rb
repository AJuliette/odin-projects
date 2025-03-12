require_relative 'player.rb'
require_relative 'board.rb'

class TicTacToe
  def initialize
    @board = Board.new
  end

  def play
    puts "Hi and welcome to this Tic Tac To Game !"
    create_players
    turn(player: @player_one)
  end

  private

  def create_players
    @player_one = create_player(number: "One", symbol: "O")
    @player_two = create_player(number: "Two", symbol: "X")
  end

  def create_player(number:, symbol:)
    puts "What's player #{number}'s first name ?"
    first_name = gets.chomp
    player = Player.new(number:, first_name:, symbol:)
    puts "Your symbol is #{symbol}"
    player
  end

  def turn(player:)
    @board.display
    player_move(player: player)
    if victory?
      @board.display
      puts "#{player.first_name} won !"
      return
    end
    next_player = player.number == "One" ? @player_two : @player_one
    turn(player: next_player)
  end

  def player_move(player:)
    puts "Its #{ player.first_name }'s turn"
    puts "What's your move ?"
    player_move_response = gets.chomp.to_i
    @board.move(player_symbol: player.symbol, square: player_move_response)
  end

  def victory?
    @board.victory?
  end
end

TicTacToe.new.play
