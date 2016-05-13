require 'rails_helper'


RSpec.describe Subscription, type: :model do
  before :all do
    @subscription = Subscription.new(name: "Basic", amount: 0)
  end
  
  it 'verifies instantiation' do
    expect(@subscription).to be_valid
  end
  
  it 'verifies presence of name' do
    @subscription.name = nil
    expect(@subscription).not_to be_valid
  end
  
  it 'verifies presence of amount' do
    @subscription.amount = nil
    expect(@subscription).not_to be_valid
  end
  
  it 'verifies amount is an integer' do
    @subscription.amount = 'AABCDS'
    expect(@subscription).not_to be_valid
  end
end

