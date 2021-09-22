class CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n.negative?

    steps = 0
    while n != 1
      steps += 1
      n = (n % 2).zero? ? n / 2 : n * 3 + 1
    end

    steps
  end
end

print(CollatzConjecture.steps(1).zero?)
print(CollatzConjecture.steps(16) == 4)
print(CollatzConjecture.steps(12) == 9)
print(CollatzConjecture.steps(1_000_000) == 152)
