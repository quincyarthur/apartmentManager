require 'rails_helper'


RSpec.describe TenantPaymentDetail, type: :model do
  before :all do
    @tenant_payment_detail = TenantPaymentDetail.new(tenant_id: 1,payment_amount: 500.25)
  end
  
  it 'verifies instantiation' do
    expect(@tenant_payment_detail).to be_valid
  end
  
  it 'verifies presence of tenant id' do
    @tenant_payment_detail.tenant_id = nil
    expect(@tenant_payment_detail).not_to be_valid
  end
  
  it 'verifies presence of payment amount' do
    @tenant_payment_detail.payment_amount = nil
    expect(@tenant_payment_detail).not_to be_valid
  end
  
  it 'verifies payment amount is numeric' do
    @tenant_payment_detail.payment_amount = 'ABCBA'
    expect(@tenant_payment_detail).not_to be_valid
  end
end

