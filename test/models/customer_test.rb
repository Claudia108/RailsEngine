require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "can find a single customer" do
    id = Customer.first.id
    name = Customer.first.first_name
    last_name = Customer.first.last_name
    created_at = Customer.first.created_at
    updated_at = Customer.first.updated_at

    customer = Customer.match(id: id)
    assert_equal id, customer["id"]
    assert_equal name, customer["first_name"]

    customer = Customer.match(first_name: name)
    assert_equal id, customer["id"]
    assert_equal name, customer["first_name"]

    customer = Customer.match(last_name: last_name)
    assert_equal id, customer["id"]
    assert_equal name, customer["first_name"]
    assert_equal last_name, customer["last_name"]

    customer = Customer.match(created_at: created_at)
    assert_equal id, customer["id"]
    assert_equal name, customer["first_name"]

    customer = Customer.match(updated_at: updated_at)
    assert_equal id, customer["id"]
    assert_equal name, customer["first_name"]
  end

  test "can find all customers by different parameters" do
    id = Customer.first.id
    name = Customer.first.first_name
    last_name = Customer.first.last_name
    created_at = Customer.first.created_at
    updated_at = Customer.first.updated_at

    customer = Customer.find_all(id: id)

    assert_equal 1, customer.count
    assert_equal id, customer.first["id"]
    assert_equal name, customer.first["first_name"]

    customer = Customer.find_all(first_name: name)

    assert_equal 1, customer.count
    assert_equal id, customer.first["id"]
    assert_equal name, customer.first["first_name"]

    customer = Customer.find_all(last_name: last_name)

    assert_equal 1, customer.count
    assert_equal id, customer.first["id"]
    assert_equal name, customer.first["first_name"]
    assert_equal last_name, customer.first["last_name"]

    customer = Customer.find_all(created_at: created_at)

    assert_equal 2, customer.count
    assert_equal id, customer.first["id"]
    assert_equal name, customer.first["first_name"]

    customer = Customer.find_all(updated_at: updated_at)

    assert_equal 2, customer.count
    assert_equal id, customer.first["id"]
    assert_equal name, customer.first["first_name"]
  end

  test "returns a random customer" do
    customer = Customer.random_dataset

    assert_equal Customer, customer.class
    assert customer.first_name
    assert customer.last_name
    assert customer.id
    assert customer.created_at
    assert customer.updated_at
  end

  test "returns favorite merchant for one customer" do
    customer = Customer.first

    assert_equal "Arcon", customer.favorite_merchant.name
  end
end
