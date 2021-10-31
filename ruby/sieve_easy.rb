class Sieve
  LOWER_ABS_LIMIT = 2
  INIT_ADDER = 2

  def initialize(upper_limit)
    @upper_limit = upper_limit
    @primes = []

    compute_primes
  end

  def compute_primes
    return primes unless upper_limit >= LOWER_ABS_LIMIT

    numbers = (LOWER_ABS_LIMIT..Math.sqrt(upper_limit)).to_a
    numbers.each do |number|
      primes << number
      adder = INIT_ADDER
      composite_number = number * adder

      while composite_number <= numbers.last
        numbers.delete(composite_number)
        adder += 1
        composite_number = number * adder
      end
    end
  end

  attr_reader :upper_limit
  attr_accessor :primes
end
