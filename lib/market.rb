class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) != 0
    end
  end

  def total_item_amount(item)
    @vendors.sum do |vendor|
      vendor.inventory[item]
    end
  end

  def total_inventory
    inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, stock|
        inventory[item] = {quantity: total_item_amount(item), vendors: vendors_that_sell(item)}
      end
    end
    inventory.keys.uniq
  end


end
