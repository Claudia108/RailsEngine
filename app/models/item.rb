class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.match(params)
    if params[:name]
      find_by("lower(name) LIKE ?", params[:name].downcase)
    elsif params[:description]
      find_by("lower(description) LIKE ?", "%#{params[:description].downcase}%")
    elsif params[:unit_price]
      price_in_dollars = (params[:unit_price].to_f * 100).round
      find_by(unit_price: price_in_dollars)
    else
      find_by(params)
    end
  end

  def self.find_all(params)
    if params[:name]
      where("lower(name) LIKE ?", params[:name].downcase)
    elsif params[:description]
      where("lower(description) LIKE ?", "%#{params[:description].downcase}%")
    elsif params[:unit_price]
      price_in_dollars = (params[:unit_price].to_f * 100).round
      where(unit_price: price_in_dollars)
    else
      where(params)
    end
  end

  def self.random_dataset
    order("RANDOM()").first
  end

  def highest_selling_day
    invoices.paid.select('invoices.created_at').group(:created_at)
            .order('SUM(invoice_items.quantity * invoice_items.unit_price) DESC')
            .first.created_at
  end

  def self.most_sold_items(quantity)
    joins(invoice_items: :transactions).where(transactions: { result: "success"})
          .group(:id).order('SUM(invoice_items.quantity) DESC')
          .limit(quantity.to_i)
  end

  def self.highest_revenue_items(quantity)
    joins(invoice_items: :transactions).where(transactions: { result: "success"})
          .group(:id).order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
          .limit(quantity.to_i)
  end
end
