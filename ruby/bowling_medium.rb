require 'ostruct'

class Game
  TOTAL_FRAMES = 10

  def initialize
    @open_frames = [Frame.new(1)]
    @closed_frames = []
    @total_score = 0
    @current_frame_numbers = []

    @roll_count = 0
  end

  def roll(pins)
    raise BowlingError if @closed_frames.size == TOTAL_FRAMES

    frames_dup = @open_frames.dup
    @roll_count += 1

    frames_dup.each do |frame|
      result = frame.consider(pins, @roll_count)
      # a frame can still be open, meaning it needs to wait for more hits before it can be moved to closed_frames
      # in the meantime, if the hit_pins is 10 or already 2 hits (or more), then a new frame can start (if not already done so already)
      next_frame_id = frame.frame_number + 1
      prevent_start = !result.new_frame_start? || next_frame_id > TOTAL_FRAMES || @current_frame_numbers.include?(next_frame_id)
      unless prevent_start
        @open_frames << Frame.new(next_frame_id)
        @current_frame_numbers << next_frame_id
      end

      next if result.still_open?

      @total_score += frame.score
      @closed_frames << frame.frame_number
      @open_frames.delete(frame)
    end
  end

  def score
    raise BowlingError if @open_frames.any? || @closed_frames.size != TOTAL_FRAMES

    @total_score
  end

  class Frame
    TOP_PIN_SCORE = 10
    MAX_NORMAL_HITS = 2
    MAX_POSSIBLE_HITS = 3
    ACCEPTABLE_PIN_VALUE = (0..10).freeze
    LAST_FRAME_MAX_VALUE_SPARE = 20
    MAX_NORMAL_ROLLS = 20
    LAST_FRAME_NUMBER = 10

    def initialize(frame_number)
      @frame_number = frame_number

      @hit_pins = 0
      @score = 0
      @hits = []
      @strike = false
      @spare = false
    end

    def consider(pins, roll_count)
      raise BowlingError unless ACCEPTABLE_PIN_VALUE.include?(pins)

      @hits << pins
      @score += pins
      compute_attrs(pins) unless strike || spare

      # Rules:
      # Two bonus rolls after a strike in the last frame cannot score more than 10 points (all 3 hits of the last frame cannot be more than 20)
      # The second bonus rolls after a strike in the last frame cannot be a strike if the first one is not a strike (strike, not strike, strike is not allowed!)
      if score > LAST_FRAME_MAX_VALUE_SPARE && max_hits? && roll_count > MAX_NORMAL_ROLLS && score % 10 != 0 && hits[0] + hits[1] < LAST_FRAME_MAX_VALUE_SPARE
        raise BowlingError
      end

      display_result
    end

    attr_reader :score, :frame_number

    private

    attr_reader :hit_pins, :hits, :strike, :spare

    def compute_attrs(pins)
      @hit_pins += pins

      raise BowlingError if hit_pins > TOP_PIN_SCORE
      return unless set_complete?

      hits.size == 1 ? @strike = true : @spare = true
    end

    def display_result
      still_open = false if last_frame? && max_hits? && strike || all_normal_hits? && spare
      still_open ||= max_hits? || normal_end? ? false : true

      OpenStruct.new(still_open?: still_open, new_frame_start?: new_frame_start?)
    end

    def new_frame_start?
      set_complete? || hits.size >= MAX_NORMAL_HITS
    end

    def set_complete?
      hit_pins == TOP_PIN_SCORE
    end

    def last_frame?
      frame_number == LAST_FRAME_NUMBER
    end

    def normal_end?
      all_normal_hits? && !strike && !spare
    end

    def all_normal_hits?
      hits.size == MAX_NORMAL_HITS
    end

    def max_hits?
      hits.size == MAX_POSSIBLE_HITS
    end
  end

  class BowlingError < StandardError
  end
end
