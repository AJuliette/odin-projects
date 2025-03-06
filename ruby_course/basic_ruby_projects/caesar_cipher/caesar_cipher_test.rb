require 'minitest/autorun'
require_relative 'caesar_cipher'

class CaesaeTest < Minitest::Test
  def test_with_one_letter_and_one_shift
    assert_equal "b", CaesarCipher.new(string: "a", shift_range: 1).perform
  end

  def test_with_one_letter_and_multiple_shift
    assert_equal "d", CaesarCipher.new(string: "a", shift_range: 3).perform
  end

  def test_with_multiple_letters
    assert_equal "cd", CaesarCipher.new(string: "ab", shift_range: 2).perform
  end

  def test_z_character
    assert_equal "a", CaesarCipher.new(string: "z", shift_range: 1).perform
  end

  def test_with_multiple_letters_and_space
    assert_equal "c d", CaesarCipher.new(string: "a b", shift_range: 2).perform
  end

  def test_sentence
    string = "What a string!"
    shift_range = 5
    crypted_string = "Bmfy f xywnsl!"
    assert_equal crypted_string, CaesarCipher.new(string:, shift_range:).perform 
  end
end
