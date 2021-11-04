class Transpose
  def self.transpose(input)
    new(input).transpose
  end

  def initialize(input)
    @input = input
  end

  def transpose
    max_size = input.lines.max_by(&:size).size
    head, *tail = input.split("\n").map { |s| (s.ljust max_size).chars }
    (head.zip *tail).map(&:join)
  end

  attr_reader :input
end

input = "A1"
expected = "A\n1"
print(Transpose.transpose(input))
# puts(Transpose.transpose(input) == expected)
