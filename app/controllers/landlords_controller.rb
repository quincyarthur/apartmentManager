class LandlordsController < ApplicationController
  def dashboard
    @properties = current_landlord.properties
  end
end
