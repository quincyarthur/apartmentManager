require 'rails_helper'


RSpec.describe PropertyAmenity , type: :model do
  
  before :all do
     @property_amenity = PropertyAmenity .new(property_id: 1, amenity_id: 2)
  end
  
  it 'verifies instantiation' do
    expect(@property_amenity).to be_valid
  end
  
  it 'verifies presence of property id' do
    @property_amenity.property_id = nil
    expect(@property_amenity).not_to be_valid
  end
  
  it 'verifies presence of amenity id' do
    @property_amenity.amenity_id = nil
    expect(@property_amenity).not_to be_valid
  end
  
  it 'verifies property id is numeric' do
    @property_amenity.property_id = 'ABB'
    expect(@property_amenity).not_to be_valid
  end
  
  it 'verifies amenity id is numeric' do
    @property_amenity.amenity_id = 'GDGG'
    expect(@property_amenity).not_to be_valid
  end
end

