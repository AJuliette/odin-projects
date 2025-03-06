class CaesarCipher
  MAX_ASCII_UPCASE = 90
  MAX_ASCII_DOWNCASE = 122

  attr_accessor :string, :shift_range

  def initialize(string:, shift_range:)
    @string = string
    @shift_range = shift_range
  end

  def perform
    @string.chars.map do |char|
      next char unless ('a'..'z').to_a.include?(char) || ('A'..'Z').to_a.include?(char)
      convert_to_letter(shift(convert_to_ascii(char)))
    end.join
  end

  private

  def convert_to_ascii(char)
    char.ord
  end

  def shift(ascii)
    if ascii + @shift_range > MAX_ASCII_DOWNCASE
      96 + ascii - (MAX_ASCII_DOWNCASE - @shift_range)
    elsif ascii < 91 && ascii + @shift_range > MAX_ASCII_UPCASE
      64 + ascii - (MAX_ASCII_UPCASE - @shift_range)
    else
      ascii + @shift_range
    end
  end

  def convert_to_letter(ascii)
    ascii.chr
  end
end
