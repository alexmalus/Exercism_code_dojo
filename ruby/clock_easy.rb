class Clock
  TIME_FORMAT = '%02d:%02d'.freeze
  HOUR_MAX_MARK = 24
  MINUTE_MAX_MARK = 60

  def initialize(hour: 0, minute: 0)
    compute_time(hour: hour, minute: minute)
  end

  def to_s
    TIME_FORMAT % [hour, minute]
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def +(other)
    compute_time(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    compute_time(hour: hour - other.hour, minute: minute - other.minute)
  end

  def compute_time(hour:, minute:)
    extra_hours = minute / MINUTE_MAX_MARK
    @minute = minute - MINUTE_MAX_MARK * extra_hours
    @hour = (hour + extra_hours) % HOUR_MAX_MARK

    self
  end

  attr_reader :hour, :minute
end
