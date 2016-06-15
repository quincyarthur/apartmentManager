class TenantRentDetail < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :property, polymorphic: true
  
  validates :tenant_id, uniqueness: {scope: [:property_id,:property_type],
                                      message: "Tenant already has a lease on this property"}
  validates :rent_due_date, :lease_start_date, :lease_end_date, :tenant_id, :property_id, :property_type, presence: true
  validate :rent_due_date_cannot_be_in_the_past, :lease_end_date_cannot_be_before_lease_start_date, :property_cannot_have_more_leases_than_units
  
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
    
   def property_cannot_have_more_leases_than_units
      @property_count =  TenantRentDetail.where(property_id: self.property.id, property_type: self.property.class.name)
      if @property_count.count == self.property.num_units
         errors.add(:property, "all of the units belonging to this property have already been leased")
      end
   end
end
