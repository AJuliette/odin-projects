require 'pry'

class SubStrings
  attr_accessor :string, :dictionary

  def initialize(string:, dictionary:)
    @string = string.downcase
    @dictionary = dictionary
  end

  def perform
    @dictionary.each_with_object({}) do |dictionary_entry, hash|
      @string.split.each do |word|
        if word.include?(dictionary_entry)
          if hash[dictionary_entry].nil?
            hash[dictionary_entry] = 0
          end
          hash[dictionary_entry] += 1
        end
      end
    end
  end
end
