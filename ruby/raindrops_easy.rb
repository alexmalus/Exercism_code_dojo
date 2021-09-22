class Raindrops
  RAINDROPS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    conversion = ''
    RAINDROPS.each { |prime, sound| conversion += sound if (number % prime).zero? }

    conversion.empty? ? number.to_s : conversion
  end
end
