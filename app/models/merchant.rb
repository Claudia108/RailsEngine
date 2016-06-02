class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

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
end
