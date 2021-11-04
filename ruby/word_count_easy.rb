# https://womanonrails.com/each-with-object
# TOSELF, great example, so KEYWORDS: group_by | transform_values
class Phrase
  MATCHER = /\b[\w']+\b/.freeze

  def initialize(phrase)
    @words = phrase.downcase.scan(MATCHER)
  end

  def word_count
    words.group_by(&:itself).transform_values(&:count)
  end

  private

  attr_reader :words
end

phrase = Phrase.new('car: carpet as java: javascript!!&@$%^&')
counts = { 'car' => 1, 'carpet' => 1, 'as' => 1, 'java' => 1, 'javascript' => 1 }
puts(phrase.word_count == counts)
