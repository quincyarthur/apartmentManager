class Property < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :category
  belongs_to :island
  has_many :tenant_rent_details
  has_many :property_amenities
  has_many :amenities, through: :property_amenities
  has_many :prospective_tenants
  
  validates :num_bedrooms, :num_bathrooms, :num_units, :monthly_amt, numericality: true
  validates :num_bedrooms, :num_units, numericality: {only_integer: true}
  validates :street_name, :num_bedrooms, :num_bathrooms, :num_units, :monthly_amt, :landlord_id, :category_id, :island_id, presence: true
  
  def property_name
    name = "#{self.num_bedrooms} Bed #{self.num_bathrooms} Bath #{self.street_name}"
  end
end
