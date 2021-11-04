# Inspirational ref: https://cs.stackexchange.com/questions/10318/the-math-behind-converting-from-any-base-to-any-base-without-going-through-base
class BaseConverter
  def self.convert(input_base, digits, output_base)
    if [input_base, output_base].any? { |base| base <= 1 } || digits.any? { |digit| digit.negative? || digit > 1 && input_base == 2 }
      raise ArgumentError, 'You shall not pass'
    end

    to_digits(from_digits(digits, input_base), output_base)
  end

  def self.from_digits(digits, input_base)
    digits.inject(0) { |number, digit| number = input_base * number + digit }
  end

  def self.to_digits(digit, output_base)
    digits = []

    while digit.positive?
      digits.unshift(digit % output_base)
      digit = (digit / output_base).floor
    end

    digits.none? ? [0] : digits
  end
end
