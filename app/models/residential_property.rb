class ResidentialProperty < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :category
  belongs_to :island
  has_many :tenant_rent_details, as: :property
  has_many :property_amenities, as: :property
  has_many :amenities, through: :property_amenities
  has_many :prospective_tenants, as: :property
  
  validates :num_bathrooms, :monthly_amt, numericality: {greater_than_or_equal_to: 1 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :num_bedrooms, :num_units, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
  validates :street_name, :num_bedrooms, :num_bathrooms, :num_units, :monthly_amt, :landlord_id, :category_id, :island_id, presence: true
  
  def property_name
    name = "#{self.num_bedrooms} Bed #{self.num_bathrooms} Bath #{self.street_name}"
  end
end
