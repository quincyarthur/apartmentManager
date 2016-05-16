class Tenant < ActiveRecord::Base
  has_many :tenant_rent_details
  has_many :tenant_payment_details
  
  validates :first_name, :last_name,presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
