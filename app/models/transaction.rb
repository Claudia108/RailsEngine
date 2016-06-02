class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def self.random_dataset
    order("RANDOM()").first
  end
  
end
