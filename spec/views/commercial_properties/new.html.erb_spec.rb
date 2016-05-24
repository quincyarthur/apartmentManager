require 'rails_helper'


RSpec.describe "commercial_properties/new", type: :view do
  before(:each) do
    assign(:commercial_property, CommercialProperty.new())

  end

  it "renders new commercial_property form" do
    render

    assert_select "form[action=?][method=?]", commercial_properties_path, "post" do

    end
  end
end
