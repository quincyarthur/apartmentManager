require 'rails_helper'


RSpec.describe "commercial_properties/edit", type: :view do
  before(:each) do
    @commercial_property = assign(:commercial_property, CommercialProperty.create!())


  end

  it "renders the edit commercial_property form" do
    render

    assert_select "form[action=?][method=?]", commercial_property_path(@commercial_property), "post" do

    end
  end
end
