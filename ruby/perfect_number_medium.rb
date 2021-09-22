class PerfectNumber
  def self.classify(number)
    new.classify(number)
  end

  def classify(input_number)
    raise RuntimeError if input_number.negative?

    sum = (1...input_number).inject { |sum, n| (input_number % n).zero? ? sum += n : sum }

    return 'perfect' if sum == input_number

    sum < input_number ? 'deficient' : 'abundant'
  end
end
