class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.match(params)
    if params[:first_name]
      find_by("lower(first_name) LIKE ?", params[:first_name].downcase)
    elsif params[:last_name]
      find_by("lower(last_name) LIKE ?", params[:last_name].downcase)
    else
      find_by(params)
    end
  end

  def self.find_all(params)
    if params[:first_name]
      where("lower(first_name) LIKE ?", params[:first_name].downcase)
    elsif params[:last_name]
      where("lower(last_name) LIKE ?", params[:last_name].downcase)
    else
      where(params)
    end
  end

  def self.random_dataset
    order("RANDOM()").first
  end
end
