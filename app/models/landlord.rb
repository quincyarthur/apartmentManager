class Landlord < ActiveRecord::Base 
  has_many :properties
  belongs_to :subscription
  
  validates :name, :phone_number, :subscription_id, presence:  true
  validates :phone_number, numericality: true
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
