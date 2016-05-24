require 'rails_helper'

RSpec.describe "CommercialProperties", type: :request do
  describe "GET /commercial_properties" do
    it "works! (now write some real specs)" do
      get commercial_properties_path
      expect(response).to have_http_status(200)
    end
  end
end
