class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  MAX_ALLOWED_COLORS = 2
  KILO_OHM_MARK = 1000

  def initialize(colors)
    @colors = colors
    @kilo_yn = false
  end

  def label
    raise ArgumentError unless colors.all? { |color| COLORS.include?(color) }

    "Resistor value: #{value} #{ohm_notation}"
  end

  private

  attr_reader :colors, :kilo_yn

  def value
    value = colors.take(MAX_ALLOWED_COLORS).collect { |color| COLORS.index(color) }.join.to_i * 10.pow(ohm_exponent)
    return value if value < KILO_OHM_MARK

    @kilo_yn = true
    value / KILO_OHM_MARK
  end

  def ohm_notation
    kilo_yn ? 'kiloohms' : 'ohms'
  end

  def ohm_exponent
    COLORS.index(colors.last)
  end
end
