class SpaceAge
  EARTH_YEAR_SECONDS = 31_557_600.to_f
  PLANET_TO_EARTH_YEARS = { earth: 1, mercury: 0.2408467, venus: 0.61519726, mars: 1.8808158, jupiter: 11.862615,
                            saturn: 29.447498, uranus: 84.016846, neptune: 164.79132 }.freeze

  def initialize(seconds)
    @seconds = seconds
  end

  PLANET_TO_EARTH_YEARS.each do |planet_name, scale|
    define_method("on_#{planet_name}") do
      seconds / (EARTH_YEAR_SECONDS * scale)
    end
  end

  private

  attr_reader :seconds
end

# test assertions already do the round-up..
