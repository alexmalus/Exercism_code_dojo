require 'forwardable'

class Bst
  extend Forwardable
  include Enumerable

  def initialize(head)
    @head = Node.new(head)
  end

  def insert(data)
    head.insert(data)
  end

  def each
    return enum_for(:each) unless block_given?

    (0...data_set.size).each { |i| yield data_set.at(i) }
  end

  def data_set
    head.each.flatten.compact.sort
  end

  def_delegators :head, :data, :left, :right
  attr_reader :head
end

class Node
  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(new_data)
    new_data <= data ? insert_left(new_data) : insert_right(new_data)
  end

  def each
    [left&.each, data, right&.each]
  end

  def insert_left(new_data)
    return left.insert(new_data) if left

    @left = Node.new(new_data)
  end

  def insert_right(new_data)
    return right.insert(new_data) if right

    @right = Node.new(new_data)
  end

  attr_accessor :data
  attr_reader :left, :right
end
