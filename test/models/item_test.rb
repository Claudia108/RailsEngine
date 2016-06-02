require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "can find a single item" do
    item = items(:one)
    id = item.id
    name = item.name
    description = item.description
    unit_price = item.unit_price.to_f / 100
    merchant_id = item.merchant_id
    created_at = item.created_at
    updated_at = item.updated_at

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
    item = items(:one)
    id = item.id
    name = item.name
    unit_price = item.unit_price.to_f / 100
    description = item.description
    merchant_id = item.merchant_id
    created_at = item.created_at
    updated_at = item.updated_at

    item = Item.find_all(id: id)

    assert_equal 1, item.count
    assert_equal id, item.last["id"]
    assert_equal name, item.last["name"]

    item = Item.find_all(name: name)

    assert_equal 1, item.count
    assert_equal id, item.last["id"]
    assert_equal name, item.last["name"]

    item = Item.find_all(description: description)

    assert_equal 1, item.count
    assert_equal id, item.last["id"]
    assert_equal name, item.last["name"]

    item = Item.find_all(unit_price: unit_price)

    assert_equal 1, item.count
    assert_equal id, item.last["id"]
    assert_equal name, item.last["name"]

    item = Item.find_all(merchant_id: merchant_id)

    assert_equal 2, item.count
    assert_equal id, item.last["id"]
    assert_equal name, item.last["name"]

    item = Item.find_all(created_at: created_at)

    assert_equal 2, item.count
    assert_equal id, item.last["id"]
    assert_equal name, item.last["name"]

    item = Item.find_all(updated_at: updated_at)

    assert_equal 2, item.count
    assert_equal id, item.last["id"]
    assert_equal name, item.last["name"]
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

end
