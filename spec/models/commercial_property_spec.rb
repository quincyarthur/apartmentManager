require 'rails_helper'


RSpec.describe CommercialProperty, type: :model do
before :all do
    @property = CommercialProperty.new(landlord_id: 1, category_id: 1,street_name: "Carmichael Road", square_feet: 2500,
                            num_bathrooms: 2, num_units: 2, monthly_amt: 2500.00, description:"Spacious Office Close to School",
                            island_id:10 )
  end
  
  #Ensures instance level methods work
  it 'creates property name using number of square feet and street name' do                          
      @property.property_name.should == "2500 Square Feet Carmichael Road"
  end
  
  #Ensures values are only numeric
  it 'saves properties with numeric square feet' do
    @property.square_feet = 'a'
    @property.should_not be_valid
  end
  
  it 'saves properties with numeric num bathrooms' do
    @property.num_bathrooms = 'a'
    @property.should_not be_valid  
  end
  
  it 'saves properties with numeric num units' do
    @property.num_units = 'a'
    @property.should_not be_valid  
  end
  
  it 'saves properties with numeric monthly amounts' do
    @property.monthly_amt = 'a'
    @property.should_not be_valid  
  end
  
  #Ensures values are only integers  
  it 'saves properties with integer num units' do
    @property.num_units = 5.5
    @property.should_not be_valid  
  end
  
  #Ensures currency values are valid    
  it 'ensures monthly_amt is a valid decimal' do
    @property.num_bathrooms = 5.5544554
    @property.should_not be_valid  
  end
  
  #Ensures the presence of values
  it 'verifies street name is not nil' do
    @property.street_name = nil
    @property.should_not be_valid  
  end
    
  it 'verifies number of bathrooms is not nil' do
    @property.num_bathrooms = nil
    @property.should_not be_valid  
  end
  
  it 'verifies number of units is not nil' do
    @property.num_units = nil
    @property.should_not be_valid  
  end
  
  it 'verifies monthly amount is not nil' do
    @property.monthly_amt = nil
    @property.should_not be_valid  
  end
  
  #Ensures numeric values are positive
  it 'verifies square_feet is positive' do
    @property.square_feet = -1
    @property.should_not be_valid  
  end
  
  it 'verifies num_bathrooms is positive' do
    @property.num_bathrooms = -1
    @property.should_not be_valid  
  end
  
  it 'verifies num_units is positive' do
    @property.num_units = -1
    @property.should_not be_valid  
  end
  
  it 'verifies monthly_amt is positive' do
    @property.monthly_amt = -1
    @property.should_not be_valid  
  end
  
  
end

