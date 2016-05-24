class TenantRentDetail < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :property, polymorphic: true
  
  validates :rent_due_date, :lease_start_date, :lease_end_date, :tenant_id, :property_id, presence: true
  validate :rent_due_date_cannot_be_in_the_past, :lease_end_date_cannot_be_before_lease_start_date
  
  #Custom Validation Methods
  
   def rent_due_date_cannot_be_in_the_past
    if self.rent_due_date.present? && self.rent_due_date < Date.today
       errors.add(:rent_due_date, "can't be a date in the past")
    end
  end
    
  def lease_end_date_cannot_be_before_lease_start_date
     if self.lease_end_date.present? && self.lease_end_date < self.lease_start_date
       errors.add(:lease_end_date, "can't be before the start date of the lease")
    end
  end
  
end
