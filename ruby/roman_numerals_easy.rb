class Integer
  MAPPING = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
              90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }.freeze

  def to_roman
    roman_numbers = ''
    normal_number = self

    MAPPING.each do |number, roman_number|
      while normal_number >= number
        normal_number -= number
        roman_numbers += roman_number
      end
    end

    roman_numbers
  end
end
