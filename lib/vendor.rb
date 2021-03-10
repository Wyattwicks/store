class Vendor

  attr_reader :name, :inventory, :item_amount

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @item_amount = @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end


 #Got stuck with this method and spent way too long trying to figure it out. :(
  def potential_revenue
      @inventory.sum do |item|
        inventory[@price_int] * @item_amount.to_i if @item_amount != 0 || nil
      end
  end
end
