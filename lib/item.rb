class Item
  attr_reader :name, :price, :price_int

  def initialize(info)
    @name = info[:name]
    @price = info[:price]
    @price_int = info[:price].delete('$').to_f
  end
end
