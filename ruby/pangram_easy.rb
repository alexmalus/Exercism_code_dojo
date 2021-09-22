module Pangram
  INIT_MATCH = 0

  def self.pangram?(sentence)
    alphabet = Hash[('a'..'z').to_a.collect { |letter| [letter, INIT_MATCH] }]
    sentence.downcase.each_char { |char| alphabet[char] && alphabet[char] += 1 }
    alphabet.values.all?(&:positive?)
  end
end
