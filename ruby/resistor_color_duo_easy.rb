class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze
  MAX_ALLOWED_COLORS = 2

  def self.value(colors)
    colors.take(MAX_ALLOWED_COLORS).collect { |color| COLORS.index(color) }.join.to_i
  end
end
