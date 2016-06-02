class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity
  attribute :price_in_dollars, key: :unit_price

  def price_in_dollars
    (object.unit_price.to_f / 100).to_s
  end
end
