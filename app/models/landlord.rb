class Landlord < ActiveRecord::Base 
  has_many :properties
  belongs_to :subscription
  
  validates :name, :phone_number, :subscription_id, presence:  true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def get_basic_balance
    basic_balance = (self.properties.count * 30) >= 0 ? 30 : self.properties.count * 30
  end
  
  def calc_balance
    if self.subscription.name == 'Basic'
      balance = get_basic_balance
    elsif self.subscription.name == 'Premium'
      balance = get_basic_balance + 30
    end
  end
end
