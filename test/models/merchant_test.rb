require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "can find a single merchant" do
    merchant_one = merchants(:one)
    id = merchant_one.id
    name = merchant_one.name
    created_at = merchant_one.created_at
    updated_at = merchant_one.updated_at

    merchant = Merchant.match(id: id)
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]

    merchant = Merchant.match(name: name)
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]

    merchant = Merchant.match(created_at: created_at)
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]

    merchant = Merchant.match(updated_at: updated_at)
    assert_equal id, merchant["id"]
    assert_equal name, merchant["name"]
  end

  test "can find all merchants by different parameters" do
    merchant_one = merchants(:one)
    id = merchant_one.id
    name = merchant_one.name
    created_at = merchant_one.created_at
    updated_at = merchant_one.updated_at

    merchant = Merchant.find_all(id: id)

    assert_equal 1, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]

    merchant = Merchant.find_all(name: name)

    assert_equal 2, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]

    merchant = Merchant.find_all(created_at: created_at)

    assert_equal 2, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]

    merchant = Merchant.find_all(updated_at: updated_at)

    assert_equal 2, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]
  end

  test "returns a random merchant" do
    merchant = Merchant.random_dataset

    assert_equal Merchant, merchant.class
    assert merchant.name
    assert merchant.id
    assert merchant.created_at
    assert merchant.updated_at
  end

end
