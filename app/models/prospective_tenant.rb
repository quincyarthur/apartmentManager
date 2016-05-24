class ProspectiveTenant < ActiveRecord::Base
  belongs_to :property, polymorphic: true
  
  validates :property_id, :name, :phone_number, :appointment_date, presence: true
  validate :appointment_date_cannot_be_in_the_past
  
    def appointment_date_cannot_be_in_the_past
    if self.appointment_date.present? && self.appointment_date < Date.today
       errors.add(:appointment_date, "can't be a date in the past")
    end
  end
end
