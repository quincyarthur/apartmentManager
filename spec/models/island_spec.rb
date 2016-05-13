require 'rails_helper'


RSpec.describe Island, type: :model do
  before :all do
    @island = Island.new(name: "Bimini")
  end
  
  it 'verifies instantiation' do
    expect(@island).to be_valid
  end
  
  it 'verifies presence of name' do
    @island.name = nil
    expect(@island).not_to be_valid
  end
end

