class PropertyAmenity < ActiveRecord::Base
  belongs_to :amenity
  belongs_to :property, polymorphic: true
  
  #validates :property_id, :property_type, :amenity_id, presence: true
  #validates :property_id, :amenity_id, numericality: true
end
