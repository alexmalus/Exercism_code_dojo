class ListOps
  def self.arrays(arr)
    counter = 0
    arr.each { |_el| counter += 1 }
    counter
  end

  def self.reverser(arr)
    new_arr = []
    new_arr << arr.pop while arr.any?
    new_arr
  end

  def self.concatter(arr1, arr2)
    arr1 + arr2
  end

  def self.mapper(arr)
    return arr unless block_given?

    changed = []
    (0...arr.size).each { |i| changed[i] = yield arr.at(i) }
    changed
  end

  def self.filterer(arr)
    return arr unless block_given?

    changed = []
    arr.each { |el| changed << el if yield(el) }
    changed
  end

  def self.sum_reducer(arr)
    sum = 0
    arr.each { |el| sum += el }
    sum
  end

  def self.factorial_reducer(arr)
    Factorial.new.compute(arr.max.to_i)
  end
end

class Factorial
  MIN_NUMBER = 1

  def compute(num)
    return MIN_NUMBER if num <= 1

    num * compute(num - 1)
  end

  attr_reader :num
end
