class ResidentialProperty < ActiveRecord::Base
  include Filterable
  
  #scopes
  scope :min_monthly_amt, -> (min) { where "monthly_amt >= ?","#{min}" }
  scope :max_monthly_amt, -> (max) { where "monthly_amt <= ?","#{max}" }
  scope :num_bedrooms, -> (num_bedrooms) {where num_bedrooms: num_bedrooms}
  scope :num_bathrooms, -> (num_bathrooms) {where num_bathrooms: num_bathrooms}
  scope :island_id, -> (island_id) {where island_id: island_id}

  #associations
  belongs_to :landlord
  belongs_to :island
  has_many :tenant_rent_details, as: :property
  has_many :photos, as: :property
  #accepts_nested_attributes_for :photo_images
  has_many :property_amenities, as: :property
  has_many :amenities, through: :property_amenities
  has_many :prospective_tenants, as: :property
  
  #validations
  validates :num_bathrooms, :monthly_amt, numericality: {greater_than_or_equal_to: 1 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :num_bedrooms, :num_units, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
  validates :street_name, :num_bedrooms, :num_bathrooms, :num_units, :monthly_amt, :landlord_id, :island_id, presence: true
  
  #custom methods
  def property_name
    name = "#{self.num_bedrooms} Bed #{self.num_bathrooms} Bath #{self.street_name}"
  end

  def attachments_array=(array)
    array.each do |file|
       images.build(:image => file)
    end
  end
end
