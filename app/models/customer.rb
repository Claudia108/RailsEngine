class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.match(params)
    conditions(params, :find_by)
  end

  def self.find_all(params)
    conditions(params, :where)
  end

  def self.conditions(params, finder)
    if params[:first_name]
      self.send(finder, 'lower(first_name) LIKE ?', params[:first_name].downcase)
    elsif params[:last_name]
      self.send(finder, 'lower(last_name) LIKE ?', params[:last_name].downcase)
    else
      self.send(finder, params)
    end
  end

  def self.random_dataset
    order('RANDOM()').first
  end

  def favorite_merchant
    merchant_id = invoices.paid.select('merchant_id, count(merchant_id) as frequency')
                .order('frequency desc').group(:merchant_id).first.merchant_id
    Merchant.find(merchant_id)
  end

end
