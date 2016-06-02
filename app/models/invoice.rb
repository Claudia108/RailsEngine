class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant

  def self.random_dataset
    order("RANDOM()").first
  end
end
