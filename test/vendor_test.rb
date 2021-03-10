require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor1
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor1.name
    assert_equal ({}), @vendor1.inventory
  end

  def test_check_stock
    assert_equal 0, @vendor1.check_stock(@item1)
  end

  def test_stock
    @vendor1.stock(@item1, 30)
    assert_equal 30, @vendor1.check_stock(@item1)
  end

  def test_multiple_stock
    @vendor1.stock(@item1, 30)
    @vendor1.stock(@item1, 25)
    assert_equal 55, @vendor1.check_stock(@item1)
  end

  def test_inventory_after_stocking
    @vendor1.stock(@item1, 30)
    @vendor1.stock(@item1, 25)
    @vendor1.stock(@item2, 12)
    answer_hash = {@item1 => 55, @item2 => 12}
    assert_equal answer_hash, @vendor1.inventory
  end

  def test_potential_revenue
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    assert_equal 29.75, @vendor1.potential_revenue
  end


end
