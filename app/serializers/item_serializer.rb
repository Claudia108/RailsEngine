class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name
  attribute :price_in_dollars, key: :unit_price

  def price_in_dollars
    (object.unit_price.to_f / 100).to_s
  end
end
