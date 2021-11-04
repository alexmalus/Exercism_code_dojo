# https://ruby-doc.org/core-3.0.2/Array.html#method-i-bsearch_index
#
# In find-any mode, method bsearch returns some element for which the block returns zero,
# or nil if no such element is found.
class BinarySearch
  def initialize(arr)
    @arr = arr
  end

  def search_for(number)
    arr.bsearch_index { |el| number - el }
  end

  attr_reader :arr
end
