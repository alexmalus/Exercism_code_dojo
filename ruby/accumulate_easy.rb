class Array
  def accumulate
    return enum_for(:accumulate) unless block_given?

    changed = []
    (0...size).each { |i| changed[i] = yield at(i) }
    changed
  end
end

result = [1, 2, 3].accumulate do |number|
  number * number
end
print(result)
# print(result == [1, 4, 9])
