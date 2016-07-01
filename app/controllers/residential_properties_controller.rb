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
    @property_landlord = @residential_property.landlord
    @amount_of_interest_shown = @residential_property.prospective_tenants.count
    @prospective_tenant = @residential_property.prospective_tenants.build
  end

  def new
    @residential_property = ResidentialProperty.new
    @residential_property.photos.build
  end
  
  def edit
  end
  
  def create
    @residential_property = ResidentialProperty.new(property_params)

    if params[:images].present?
       params[:images].each do |pic|
           @residential_property.photos.build( image: pic)
       end  
    end

    if params[:property_amenities].present?
       params[:property_amenities].each do |amenity|
        @residential_property.property_amenities.build( amenity_id: amenity)
       end  
    end

    respond_to do |format|
      if @residential_property.save      
        format.html { redirect_to "/dashboard", notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @residential_property }
      else
        format.html { render :new }
        format.json { render json: @residential_property.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @residential_property.update(property_params)

        if params[:images].present?
           params[:images].each do |pic|
              @residential_property.photos.create( image: pic)
           end  
        end

        if params[:residential_property_amenities].present?
           params[:residential_property_amenities].each do |amenity|
              @residential_property.property_amenities.destroy
              @residential_property.property_amenities.create(amenity_id: amenity)
           end  
        end

        format.html { redirect_to @residential_property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @residential_property }
      else
        format.html { render :edit }
        format.json { render json: @residential_property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @residential_property.destroy
    respond_to do |format|
      format.html { redirect_to residential_properties_url, notice: 'Property was successfully destroyed.' }
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
      @residential_property = ResidentialProperty.find(params[:id]) if params[:id].present?
    end

    def property_params
      params.require(:residential_property).permit(:landlord_id,:street_name,:island_id,:num_bedrooms,:num_bathrooms,:monthly_amt,:description,:category_id,:num_units)
      #params.fetch(:property, {})
    end
end
