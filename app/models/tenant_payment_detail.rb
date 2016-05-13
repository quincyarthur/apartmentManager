class TenantPaymentDetail < ActiveRecord::Base
  belongs_to :tenant
  
  validates :tenant_id, :payment_amount, presence: true
  validates :payment_amount, numericality: true
end
