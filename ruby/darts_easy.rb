# Dev note: calculation of radius/@point were inspired by: https://doubleroot.in/lessons/circle/position-of-a-point/
class Darts
  RADIUS_SCORE_MATCHER = { (0.0..1.0) => 10, (1.0.next_float..25) => 5, (25.0.next_float..100) => 1 }.freeze

  def initialize(coord_x, coord_y)
    @point = coord_x.to_f**2 + coord_y.to_f**2
  end

  def score
    RADIUS_SCORE_MATCHER.find { |radius, score| break score if radius.include? @point }.to_i
  end
end
