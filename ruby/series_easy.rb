# https://scoutapm.com/blog/ruby-enumerator
# puts fib.lazy.first(10)

class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(slice_by)
    raise ArgumentError if slice_by > digits.size

    # each_char, each_cons - return back an enumerator, meaning you can chain them.
    # assuming n == 2 :
    # %w(s t r i n g)
    # [%w(s t), %w(t r), %w(r i), %w(i n), %w(n g)]
    # %w(st tr ri in ng)
    digits.each_char.each_cons(slice_by).map(&:join)
  end

  private

  attr_reader :digits
end

series = Series.new('92834')
print %w[9 2 8 3 4] == series.slices(1)
