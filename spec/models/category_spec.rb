require 'rails_helper'


RSpec.describe Category, type: :model do
  before :all do
    @category = Category.new(name: "Residential")
  end
  
  it 'verifies instantiation' do
    expect(@category).to be_valid
  end
  
  it 'verifies the presence of name' do
      @category.name = nil
      expect(@category).not_to be_valid
  end
end

