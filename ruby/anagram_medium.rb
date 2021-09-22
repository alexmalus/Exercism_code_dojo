class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(anagrams)
    results = []
    return results if anagrams.all? { |anagram| anagram.casecmp?(word) }

    word.chars.permutation do |c_word|
      perm_word = c_word.join
      anagrams.each { |anagram| results << anagram if anagram.casecmp?(perm_word) && !anagram.casecmp?(word) }
    end

    results.uniq
  end

  private

  attr_reader :word
end
