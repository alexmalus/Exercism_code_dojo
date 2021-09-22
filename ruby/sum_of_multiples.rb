class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(to_number)
    return 0 if @factors.include?(0)

    @factors.flat_map { |factor| (factor...to_number).step(factor).to_a }.uniq.sum
  end
end
