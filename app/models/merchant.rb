class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.match(params)
    if params[:name]
      find_by("lower(name) LIKE ?", params[:name].downcase)
    else
      find_by(params)
    end
  end

  def self.find_all(params)
    if params[:name]
      where("lower(name) LIKE ?", params[:name].downcase)
    else
      where(params)
    end
  end

  def self.random_dataset
    order("RANDOM()").first
  end

  def total_revenue
    invoices.paid.joins(:invoice_items).sum("quantity * unit_price").to_f / 100
  end

  def revenue_by_date(date)
    invoices.paid.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price").to_f / 100
  end

  def favorite_customer
    customer_id = invoices.paid.select('customer_id, count(customer_id) as frequency')
                  .order("frequency desc").group(:customer_id).first.customer_id
    Customer.find(customer_id)
  end

  def customers_with_pending_invoices
    id = invoices.pending.pluck(:customer_id)
    Customer.where(id: id)
  end

  def self.ordered_by_revenue(quantity)
    joins(invoices: [:transactions, :invoice_items])
             .where(transactions: {result: "success"}).group(:id)
             .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
             .limit(quantity.to_i)
  end

  def self.ordered_by_sold_items(quantity)
    joins(invoices: [:transactions, :invoice_items])
                .where(transactions: {result: "success"}).group(:id)
                .order('SUM(invoice_items.quantity) DESC')
                .limit(quantity.to_i)
  end

  def self.revenue_all_merchants_by_date(date)
    joins(invoices: [:transactions, :invoice_items])
                .where(invoices: {created_at: date})
                .where(transactions: {result: "success"})
                .sum('quantity * unit_price').to_f / 100
  end
end
