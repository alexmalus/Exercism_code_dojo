# Inspired by: https://codereview.stackexchange.com/a/90872
class Prime
  FIRST_PRIME = 2

  def self.nth(desired_nth)
    raise ArgumentError, "Cannot calculate the #{desired_nth}nth prime" if desired_nth < 1

    # desired_nth * (Math.log(desired_nth) is suggested by Wikipedia.
    # Making sure we don't get caught by a lower approximation than the actual nth prime, add an extra 2.
    up_to = desired_nth * (Math.log(desired_nth) + 2)
    primes = (FIRST_PRIME..up_to).to_a

    primes.each { |num| primes.delete_if { |i| i > num && (i % num).zero? } }

    primes[desired_nth - 1]
  end
end
