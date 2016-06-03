require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "can find a single item" do
    id = Item.first.id
    name = Item.first.name
    description = Item.first.description
    unit_price = Item.first.unit_price.to_f / 100
    merchant_id = Item.first.merchant_id
    created_at = Item.first.created_at
    updated_at = Item.first.updated_at

    item = Item.match(id: id)
    assert_equal id, item["id"]
    assert_equal name, item["name"]

    item = Item.match(name: name)
    assert_equal id, item["id"]
    assert_equal name, item["name"]
    assert_equal description, item["description"]

    item = Item.match(description: description)
    assert_equal id, item["id"]
    assert_equal name, item["name"]
    assert_equal description, item["description"]

    item = Item.match(unit_price: unit_price)
    assert_equal id, item["id"]
    assert_equal name, item["name"]
    assert_equal description, item["description"]

    item = Item.match(merchant_id: merchant_id)
    assert_equal id, item["id"]
    assert_equal name, item["name"]
    assert_equal description, item["description"]

    item = Item.match(created_at: created_at)
    assert_equal id, item["id"]
    assert_equal name, item["name"]

    item = Item.match(updated_at: updated_at)
    assert_equal id, item["id"]
    assert_equal name, item["name"]
  end

  test "can find all items by different parameters" do
    id = Item.first.id
    name = Item.first.name
    unit_price = Item.first.unit_price.to_f / 100
    description = Item.first.description
    merchant_id = Item.first.merchant_id
    created_at = Item.first.created_at
    updated_at = Item.first.updated_at

    item = Item.find_all(id: id)

    assert_equal 1, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]

    item = Item.find_all(name: name)

    assert_equal 1, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]

    item = Item.find_all(description: description)

    assert_equal 1, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]

    item = Item.find_all(unit_price: unit_price)

    assert_equal 1, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]

    item = Item.find_all(merchant_id: merchant_id)

    assert_equal 2, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]

    item = Item.find_all(created_at: created_at)

    assert_equal 3, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]

    item = Item.find_all(updated_at: updated_at)

    assert_equal 3, item.count
    assert_equal id, item.first["id"]
    assert_equal name, item.first["name"]
  end

  test "returns a random item" do
    item = Item.random_dataset

    assert_equal Item, item.class
    assert item.id
    assert item.name
    assert item.description
    assert item.unit_price
    assert item.merchant_id
    assert item.created_at
    assert item.updated_at
  end

  test "returns top selling day for one item" do
    item = Item.first
    assert_equal "2012-03-26 13:55:41 UTC", item.highest_selling_day.to_s
  end

  test "returns most sold items" do
    items = Item.most_sold_items(2)

    assert_equal "Toy", items.first.name
    assert_equal "Mickey", items.last.name
  end

  test "returns highest revenue items" do
    items = Item.highest_revenue_items(2)

    assert_equal "Toy", items.first.name
    assert_equal "Mickey", items.last.name
  end
end
