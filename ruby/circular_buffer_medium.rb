class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.empty?

    @buffer.shift
  end

  def write(char)
    raise BufferFullException if buffer.size == size

    @buffer << char
  end

  def write!(char)
    @buffer.shift if buffer.size == size

    @buffer << char
  end

  def clear
    @buffer.clear
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  private

  attr_reader :size
  attr_accessor :buffer
end
