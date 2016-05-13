class Subscription < ActiveRecord::Base
  has_many :landlords
  
  validates :name, :amount, presence: true
  validates :amount, numericality: true
end
