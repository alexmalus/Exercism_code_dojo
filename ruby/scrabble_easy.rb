# TOSELF, great example, so KEYWORDS: scan | match | regex
class Scrabble
  POINT_MATCHER = /(?<ones>[aeioulnrst]+)|(?<twos>[dg]+)|(?<threes>[bcmp]+)|(?<fours>[fhvwy]+)|(?<fives>[k]+)|(?<eights>[jx]+)|(?<tens>[qz]+)/i.freeze
  IDX_TO_POINT = { 0 => 1, 1 => 2, 2 => 3, 3 => 4, 4 => 5, 5 => 8, 6 => 10 }.freeze

  def self.score(word)
    new(word).score
  end

  def initialize(word = nil)
    @score = 0
    compute_score(word.to_s)
  end

  attr_reader :score

  private

  def compute_score(word)
    word.scan(POINT_MATCHER).transpose.collect(&:join).each_with_index { |match, idx| @score += match.size * IDX_TO_POINT[idx] }
  end
end

puts(Scrabble.new('street').score == 6)
