class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def self.match(params)
    if params[:unit_price]
      price_in_dollars = (params[:unit_price].to_f * 100).round
      find_by(unit_price: price_in_dollars)
    else
      find_by(params)
    end
  end

  def self.find_all(params)
    if params[:unit_price]
      price_in_dollars = (params[:unit_price].to_f * 100).round
      where(unit_price: price_in_dollars)
    else
      where(params)
    end
  end

  def self.random_dataset
    order("RANDOM()").first
  end
end
