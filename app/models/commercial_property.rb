class CommercialProperty < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :category
  belongs_to :island
  has_many :tenant_rent_details, as: :property
  has_many :property_amenities, as: :property
  has_many :amenities, through: :property_amenities
  has_many :prospective_tenants, as: :property
  
  validates :monthly_amt, :num_bathrooms, numericality: {greater_than_or_equal_to: 1 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :num_units, :square_feet, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
  validates :street_name, :num_bathrooms, :num_units, :monthly_amt, :landlord_id, :category_id, :island_id, presence: true
  
  def property_name
    name = "#{self.square_feet} Square Feet #{self.street_name}"
  end
  
end
