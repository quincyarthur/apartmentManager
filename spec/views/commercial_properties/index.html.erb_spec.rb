require 'rails_helper'


RSpec.describe "commercial_properties/index", type: :view do
  before(:each) do
    assign(:commercial_properties, [

      CommercialProperty.create!(),



      CommercialProperty.create!()



    ])
  end

  it "renders a list of commercial_properties" do
    render

  end
end
