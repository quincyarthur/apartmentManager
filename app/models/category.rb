class Category < ActiveRecord::Base
  has_many :properties
  has_many :commercial_properties
  
  validates :name,presence: true
end
