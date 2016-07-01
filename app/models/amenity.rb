class Amenity < ActiveRecord::Base
  has_many :property_amenities
 
  validates :name, presence: true
end
