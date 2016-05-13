require 'rails_helper'


RSpec.describe Tenant, type: :model do
 before :all do
   @tenant = FactoryGirl.build(:tenant)
 end
 
 it 'verifies instantiation' do
   expect(@tenant).to be_valid
 end
 
  it 'verifies presence of first name' do
    @tenant.first_name = nil
    expect(@tenant).not_to be_valid
  end
  
  it 'verifies presence of last name' do
    @tenant.last_name = nil
    expect(@tenant).not_to be_valid
  end
  
  it 'verifies phone number is an integer' do
    @tenant.phone_number = 'ABCD'
    expect(@tenant).not_to be_valid
  end
end

