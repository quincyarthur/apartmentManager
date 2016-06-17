class ResidentialPropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_filter :require_landlord, :only => [:new,:create,:edit, :update, :delete]

  def index
     @residential_properties = ResidentialProperty.filter(params.slice(:island_id,:num_bedrooms,:num_bathrooms,:min_monthly_amt,:max_monthly_amt))
      unless @residential_properties.present?
        flash[:notice] = "No Properties matching this criteria were found"
        redirect_to :back
      end 
  end

  def show
    @property_landlord = @property.landlord
    @amount_of_interest_shown = @property.prospective_tenants.count
    @prospective_tenant = ProspectiveTenant.new()
  end

  def new
    @property = ResidentialProperty.new
  end
  
  def edit
  end
  
  def create
    @property = ResidentialProperty.new(property_params)

    respond_to do |format|
      if @property.save

        if params[:images]
            params[:images].each do |image|
              @property.photos.create(image: image)
            end  
        end
        
        format.html { redirect_to "/dashboard", notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def require_landlord
      unless landlord_signed_in?
        redirect_to root_path
      end
    end
    def set_property
      @property = ResidentialProperty.find(params[:id]) if params[:id].present?
    end

    def property_params
      params.require(:residential_property).permit(:landlord_id,:street_name,:island_id,:num_bedrooms,:num_bathrooms,:monthly_amt,:description,:category_id,:num_units)
      #params.fetch(:property, {})
    end
end
