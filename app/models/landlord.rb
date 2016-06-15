class Landlord < ActiveRecord::Base 
  #Scopes
  scope :active, -> {where active: true}
  
  #Relationships
  has_many :residential_properties
  has_many :commercial_properties
  belongs_to :subscription
  
  #Validations
  validates :name, :phone_number, :subscription_id, presence:  true
  
  #Devise Modules
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #Custom Methods
  def get_basic_balance
    total_number_of_properties = (self.residential_properties.count) + (self.commercial_properties.count)
    basic_balance = total_number_of_properties <= 0 ? 30 : total_number_of_properties * 30
  end
  
  def calc_balance
    if self.subscription.name == 'Basic'
      balance = get_basic_balance
    elsif self.subscription.name == 'Premium'
      balance = get_basic_balance + 30
    end
  end
end
