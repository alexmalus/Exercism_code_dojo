class Luhn
  NON_DIGITS = /[^0-9]/.freeze

  def self.valid?(input)
    input.gsub!(' ', '')
    return false if input.size <= 1 || input =~ NON_DIGITS

    computed_val = []
    input.reverse.chars.collect(&:to_i).each_with_index do |num, idx|
      val = (idx + 1) % 2 == 0 ? num * 2 : num
      val = val > 9 ? val - 9 : val

      computed_val << val
    end

    computed_val.inject(:+) % 10 == 0 ? true : false
  end
end

# print Luhn.valid?('059')
print Luhn.valid?("055 444 285")
