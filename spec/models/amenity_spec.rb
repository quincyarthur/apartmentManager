require 'rails_helper'

RSpec.describe Amenity, type: :model do
  before :all do
    @amenity = Amenity.new(name: "Cable")
  end
  
  it 'verifies instantiation' do
    expect(@amenity).to be_valid
  end
  
  it 'verifies presence of name' do
    @amenity.name = nil
    expect(@amenity).not_to be_valid
  end
end

