class Change
  def self.generate(all_coins, sum_coins)
    raise NegativeTargetError if sum_coins.negative?
    return [] if sum_coins.zero?

    new(all_coins, sum_coins).generate
  end

  def initialize(all_coins, sum_coins)
    @all_coins = all_coins
    @sum_coins = sum_coins
  end

  def generate(times = 1)
    set_combos = @all_coins.repeated_combination(times)

    raise ImpossibleCombinationError if set_combos.first.sum > @sum_coins

    result = set_combos.select { |combi| combi.sum == @sum_coins }
    result.any? ? result.flatten : generate(times + 1)
  end

  class ImpossibleCombinationError < StandardError
  end

  class NegativeTargetError < StandardError
  end
end
