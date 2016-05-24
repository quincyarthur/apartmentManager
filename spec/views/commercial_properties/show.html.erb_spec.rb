require 'rails_helper'


RSpec.describe "commercial_properties/show", type: :view do
  before(:each) do
    @commercial_property = assign(:commercial_property, CommercialProperty.create!())


  end

  it "renders attributes in <p>" do
    render

  end
end
