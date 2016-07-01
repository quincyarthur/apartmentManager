class LandlordsController < ApplicationController

  def dashboard
    @residential_properties = current_landlord.residential_properties
    @commercial_properties = current_landlord.commercial_properties
  end

end
