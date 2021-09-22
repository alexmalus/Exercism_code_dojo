# TOSELF, great example, so KEYWORDS: scan | match | regex
class WordProblem
  OPERATIONS = {
    'What is' => ->(_, operand) { operand },
    'plus' => ->(start, operand) { start + operand },
    'minus' => ->(start, operand) { start - operand },
    'multiplied by' => ->(start, operand) { start * operand },
    'divided by' => ->(start, operand) { start / operand },
    'raised to the' => ->(start, operand) { start**operand }
  }.freeze
  MATCHER = /(#{OPERATIONS.keys.join('|')}) (-?[\d)]+)/.freeze
  INCOMPLETE_SPEC_SIZE = 1

  def initialize(problem)
    @problem = problem
  end

  def answer
    raise ArgumentError if parsed.size <= INCOMPLETE_SPEC_SIZE

    parsed.reduce(0) { |acc, (op, val)| OPERATIONS[op].call(acc, val.to_i) }
  end

  private

  def parsed
    problem.scan(MATCHER)
  end

  attr_reader :problem
end

problem = WordProblem.new("What is 52 cubed?")
problem.answer