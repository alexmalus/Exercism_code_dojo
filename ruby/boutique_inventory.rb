class BoutiqueInventory
  MAX_CHEAP_THRESHOLD = 29

  def initialize(items)
    @items = items
  end

  def item_names
    items.sort_by { |item| item[:name] }.collect { |item| item[:name] }
  end

  def cheap
    items.select { |item| item[:price] <= MAX_CHEAP_THRESHOLD }
  end

  def out_of_stock
    items.select { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    items.detect { |item| item[:name] == name }[:quantity_by_size]
  end

  def total_stock
    items.collect { |item| item[:quantity_by_size].values.sum }.sum
  end

  private

  attr_reader :items
end

shoes = { price: 30.00, name: 'Shoes', quantity_by_size: { s: 1, xl: 4 } }
coat = { price: 65.00, name: 'Coat', quantity_by_size: {} }
handkerchief = { price: 19.99, name: 'Handkerchief', quantity_by_size: {} }
items = [shoes, coat, handkerchief]
print(BoutiqueInventory.new(items).total_stock == 5)
