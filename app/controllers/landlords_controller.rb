class LandlordsController < ApplicationController
  def dashboard
    @properties = current_landlord.residential_properties
    @properties << current_landlord.commercial_properties
  end
end
