require 'rails_helper'

RSpec.describe Landlord, type: :model do
    before :all do     
      @landlord = FactoryGirl.build(:landlord)
    end
    
    it 'verifies instantiation' do
      expect(@landlord).to be_valid
    end
    
    it 'verifies that phone number is a number' do
       @landlord.phone_number = 'Addbb'
       expect(@landlord).not_to be_valid
    end
    
    it 'verifies presence of name' do
      @landlord.name = nil
      expect(@landlord).not_to be_valid
    end
    
    it 'verifies presence of phone number' do
      @landlord.phone_number = nil
      expect(@landlord).not_to be_valid
    end
    
    it 'verifies presence of subscription id' do
      @landlord.subscription_id = nil
      expect(@landlord).not_to be_valid
    end
    
    it 'verifies presence of email' do
      @landlord.email = nil
      expect(@landlord).not_to be_valid
    end
    
    it 'verifies presence of password' do
      @landlord.password = nil
      expect(@landlord).not_to be_valid
    end
end

