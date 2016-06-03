require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "can find a single merchant" do
    id = Merchant.first.id
    name = Merchant.first.name
    created_at = Merchant.first.created_at
    updated_at = Merchant.first.updated_at

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
    id = Merchant.first.id
    name = Merchant.first.name
    created_at = Merchant.first.created_at
    updated_at = Merchant.first.updated_at

    merchant = Merchant.find_all(id: id)

    assert_equal 1, merchant.count
    assert_equal id, merchant.first["id"]
    assert_equal name, merchant.first["name"]

    merchant = Merchant.find_all(name: name)

    assert_equal 1, merchant.count
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

  test "returns total revenue for one merchant" do
    merchant = Merchant.first
    assert_equal 4.02, merchant.total_revenue
  end

  test "returns revenue by date for one merchant" do
    merchant = Merchant.first
    assert_equal 4.02, merchant.revenue_by_date("2012-03-26 13:55:41")
  end

  test "returns favorite customer for merchant" do
    merchant = Merchant.first
    assert_equal 2, merchant.favorite_customer.id
    assert_equal "Michael", merchant.favorite_customer.first_name
    assert_equal "Finnegan", merchant.favorite_customer.last_name
  end

  test "returns all customers with pending invoices for merchant" do
    merchant = Merchant.first

    assert_equal 1, merchant.customers_with_pending_invoices.count
    assert_equal "Michael", merchant.favorite_customer.first_name
    assert_equal "Finnegan", merchant.favorite_customer.last_name
  end

  test "returns top merchants ordered by revenue" do
    merchants = Merchant.ordered_by_revenue(2)
    assert_equal "Idello", merchants.first.name
    assert_equal "Idello", merchants.first.name
  end

  test "returns top merchants by number of sold items" do
    merchants = Merchant.ordered_by_sold_items(2)
    assert_equal "Arcon", merchants.last.name
    assert_equal "Idello", merchants.first.name
  end

  test "returns total revenue of all merchants by date" do
    merchants = Merchant.revenue_all_merchants_by_date("2012-03-26 13:55:41")
    assert_equal 4.02, merchants
  end
end
