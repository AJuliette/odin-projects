require 'minitest/autorun'
require_relative 'sub_strings'

class SubStringsTest < Minitest::Test
  def test_one_word
    string = "below"
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    count = { "below" => 1, "low" => 1 }
    assert_equal count, SubStrings.new(string:, dictionary:).perform 
  end

  def test_sentence
    string = "Howdy partner, sit down! How's it going?"
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    count = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
    assert_equal count, SubStrings.new(string:, dictionary:).perform 
  end
end
