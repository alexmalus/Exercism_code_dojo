class SimpleLinkedList
  def initialize(*items)
    items.flatten.map { |item| item.is_a?(Integer) ? item : item.to_a }.flatten.each { |item| push(Element.new(item)) }
  end

  def push(item)
    @element ? element.push(item) : @element = item

    self
  end

  def pop
    return unless element

    if element.next
      element.pop
    else
      val = element
      @element = nil

      val
    end
  end

  def to_a
    element && element.to_a.flatten.compact.reverse || []
  end

  def reverse!
    return self unless element

    elements = []
    elements << pop until element.nil?
    elements.each { |element| push(element) }
    self
  end

  attr_accessor :element
end

class Element
  def initialize(datum)
    @datum = datum
    @next_el = nil
  end

  def push(element)
    next_el ? next_el.push(element) : @next_el = element
  end

  def pop
    if next_el.next_el
      next_el.pop
    else
      val = next_el
      @next_el = nil

      val
    end
  end

  def to_a
    [datum, next_el&.to_a]
  end

  def next
    next_el
  end

  def next=(element)
    @next_el = element
  end

  attr_accessor :datum, :next_el
end
