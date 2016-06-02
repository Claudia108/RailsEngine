class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices

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
    invoices.joins(:transactions).where(transactions: { result: "success"}).joins(:invoice_items).sum("quantity * unit_price").to_f / 100
  end

  def revenue_by_date(date)
    invoices.where(created_at: date).joins(:transactions).where(transactions: {result: "success"}).joins(:invoice_items).sum("quantity * unit_price").to_f / 100
  end

  def favorite_customer
    paid_invoices = invoices.paid
    customer_id = paid_invoices.select('customer_id, count(customer_id) as frequency').order("frequency desc").group(:customer_id).first.customer_id
    Customer.find(customer_id)
  end

  def customer_with_pending_invoices
    pending = invoices.joins(:transactions).where(transactions: { result: "failed"})
    Customer.where(id: pending.pluck(:customer_id))
  end
end
