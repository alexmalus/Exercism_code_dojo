# https://womanonrails.com/each-with-object

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
