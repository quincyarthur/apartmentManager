class CommercialProperty < ActiveRecord::Base
  include Filterable
  
  #scopes
  scope :min_square_feet, -> (min) { where "square_feet >= ?","#{min}" }
  scope :max_square_feet, -> (max) { where "square_feet <= ?","#{max}" }
  scope :min_monthly_amt, -> (min_amt) { where "monthly_amt >= ?","#{min_amt}" }
  scope :max_monthly_amt, -> (max_amt) { where "monthly_amt <= ?","#{max_amt}" }
  scope :island_id, -> (island_id) { where island_id: island_id }
  scope :category_id, -> (category_id) { where category_id: category_id}
  
  #model associations
  belongs_to :landlord
  belongs_to :category
  belongs_to :island
  has_many :tenant_rent_details, as: :property
  has_many :property_amenities, as: :property
  has_many :amenities, through: :property_amenities
  has_many :prospective_tenants, as: :property
  
  #validations 
  validates :monthly_amt, :num_bathrooms, numericality: {greater_than_or_equal_to: 1 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :num_units, :square_feet, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
  validates :street_name, :num_bathrooms, :num_units, :monthly_amt, :landlord_id, :category_id, :island_id, presence: true
  
  #custom methods
  def property_name
    name = "#{self.square_feet} Square Feet #{self.street_name}"
  end
  
end
