class Array
  def delete_elements_in(ary)
    ary.each do |x|
      if (index = index(x))
        delete_at(index)
      end
    end
    self
  end
end

class BookStore
  def self.calculate_price(basket)
    BookDiscounter.new(basket).calculate_price
  end
end

class BookDiscounter
  NO_COMBO = 1
  MAX_COMBO = 5
  INIT_PRICE = 0
  PRICE = { NO_COMBO => 8, 2 => 15.2, 3 => 21.6, 4 => 25.6, MAX_COMBO => 30 }.freeze

  def initialize(basket)
    @prices = []
    @init_basket = basket
  end

  def calculate_price
    max_min_book_combos.each { |combo| find_discount_prices(combo) }

    prices.min || INIT_PRICE
  end

  private

  attr_accessor :prices
  attr_reader :init_basket

  def find_discount_prices(max_combo, basket = init_basket.dup, price = INIT_PRICE)
    while diff_unique_books?(basket, max_combo)
      basket = extract_books(basket, max_combo)
      price += PRICE[max_combo]
    end

    return if no_discount_found?(price)

    basket.any? ? find_discount_prices(max_combo - 1, basket, price) : @prices << price
  end

  def diff_unique_books?(basket, to_remove)
    basket.uniq.size >= to_remove
  end

  def extract_books(basket, to_remove)
    removed_books = extract_larger_stocks(basket, to_remove)

    return basket if removed_books.size == to_remove

    pending_removal = (basket.uniq - removed_books).first(to_remove - removed_books.size)
    basket.delete_elements_in(pending_removal)
  end

  def extract_larger_stocks(basket, to_remove)
    book_counter = basket.group_by(&:itself)
    removed_books = []

    basket.uniq.each do |book|
      next unless book_counter[book].size > 1

      basket.delete_at(basket.index(book))
      removed_books << book

      break if removed_books.size == to_remove
    end

    removed_books
  end

  def max_min_book_combos
    (NO_COMBO..MAX_COMBO).to_a.reverse
  end

  def no_discount_found?(price)
    price == INIT_PRICE
  end
end
