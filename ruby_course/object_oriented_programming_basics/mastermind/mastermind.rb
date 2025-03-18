class Mastermind
  COLORS = ['yellow', 'blue', 'orange', 'green', 'purple']

  def initialize
    @pattern = ["yellow", "blue", "yellow", "purple"]
    @turns = 12
  end

  def play
    turn(1)
  end

  private

  def select_pattern
    4.times.each_with_object([]){ |i, arr| arr << COLORS.sample }
  end

  def turn(i)
    return p "You lost !" unless i != 13
    puts "What's your guess ?"
    guess = gets.chomp
    codebreaker_guess = guess.split(", ")
    if codebreaker_guess == @pattern
      p "You won"
    else
      p feedback(codebreaker_guess:)
      turn(i+1)
    end
  end

  def feedback(codebreaker_guess:)
    correct_position_and_color_check = check_for_correct_position_and_color(codebreaker_guess:)
    check_for_incorrect_position(correct_position_and_color_check:, codebreaker_guess:)
  end

  def check_for_correct_position_and_color(codebreaker_guess:)
    codebreaker_guess.each_with_object([]).each_with_index do |(codebreaker_peg, array), index|
      hash = {}
      hash[:color] = codebreaker_guess[index]
      if codebreaker_peg == @pattern[index]
        hash[:codemaker_peg] = 'red'
        array << hash
      else
        hash[:codemaker_peg] = 'blank'
        array << hash
      end
    end
  end

  def check_for_incorrect_position(correct_position_and_color_check:, codebreaker_guess:)
    correct_position_and_color_check.each_with_index do |codemaker_feedback, index|
      if codemaker_feedback[:codemaker_peg] == 'blank'
        if @pattern.count(codebreaker_guess[index]) == 1
          codemaker_feedback[:codemaker_peg] = 'white'
        elsif correct_position_and_color_check.select{ |check| check[:color] == codebreaker_guess[index] && check[:codemaker_peg] != 'blank'}.count < @pattern.count(codebreaker_guess[index])
          codemaker_feedback[:codemaker_peg] = 'white'
        end
      end
    end.map{ |check| check[:codemaker_peg] }.shuffle.join(", ")
  end
end

Mastermind.new.play
