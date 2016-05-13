require 'rails_helper'

RSpec.describe TenantRentDetail, type: :model do
  before :all do
    @tenant_rent_detail = TenantRentDetail.new(tenant_id: 1,property_id: 1, rent_due_date: Date.new(2016,5,25), lease_start_date: Date.new(2014,6,11),
                           lease_end_date: Date.new(2017,06,11))
  end
 
 #Verifies object
 it 'verifies instantiation' do
   @tenant_rent_detail.should be_valid
 end

  #Verifies custom validation methods
  it 'creates rent due dates that are not in the past' do
    @tenant_rent_detail.rent_due_date = Date.new(2014,6,25)
    @tenant_rent_detail.should_not be_valid
  end 
  
   it 'verifies lease end date is not before lease start date' do
    @tenant_rent_detail.lease_end_date = Date.new(2009,6,25)
    @tenant_rent_detail.should_not be_valid
  end 
  
  #Ensures presence of values
   it 'verifies presence of rent_due_date' do
    @tenant_rent_detail.rent_due_date = nil
    @tenant_rent_detail.should_not be_valid
  end 
  
  it 'verifies presence of lease_end_date' do
    @tenant_rent_detail.lease_end_date = nil
    @tenant_rent_detail.should_not be_valid
  end 
  
  it 'verifies presence of lease start date' do
    @tenant_rent_detail.lease_start_date = nil
    @tenant_rent_detail.should_not be_valid
  end 
  
  
end

