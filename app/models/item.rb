class Item < ActiveRecord::Base
  belongs_to :merchant

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

end
