class PrimeFactors
  def self.of(num)
    new(num).of
  end

  def initialize(num)
    @num = num
    @primes = []
  end

  def of
    return primes if num <= 1

    prime = INIT_PRIME_NUM
    while num != 1
      if (num % prime).zero?
        @num /= prime
        @primes << prime
      else
        prime += 1
      end
    end

    primes
  end

  private

  INIT_PRIME_NUM = 2
  attr_reader :num, :primes
end
