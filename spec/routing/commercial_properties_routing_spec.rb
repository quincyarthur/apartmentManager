require "rails_helper"


RSpec.describe CommercialPropertiesController, type: :routing do
  describe "routing" do


    it "routes to #index" do
      expect(:get => "/commercial_properties").to route_to("commercial_properties#index")
    end


    it "routes to #new" do
      expect(:get => "/commercial_properties/new").to route_to("commercial_properties#new")
    end

    it "routes to #show" do
      expect(:get => "/commercial_properties/1").to route_to("commercial_properties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/commercial_properties/1/edit").to route_to("commercial_properties#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/commercial_properties").to route_to("commercial_properties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/commercial_properties/1").to route_to("commercial_properties#update", :id => "1")
    end


    it "routes to #update via PATCH" do
      expect(:patch => "/commercial_properties/1").to route_to("commercial_properties#update", :id => "1")
    end


    it "routes to #destroy" do
      expect(:delete => "/commercial_properties/1").to route_to("commercial_properties#destroy", :id => "1")
    end

  end
end

