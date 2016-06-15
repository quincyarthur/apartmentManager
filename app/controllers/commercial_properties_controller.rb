class CommercialPropertiesController < ApplicationController
  before_action :set_commercial_property, only: [:show, :edit, :update, :destroy]
  before_filter :require_landlord, :only => [:new,:create,:edit, :update, :delete]

  def index
    @commercial_properties = CommercialProperty.filter(params.slice(:island_id,:category_id,:min_square_feet,:max_square_feet,:min_monthly_amt,:max_monthly_amt))
    unless @commercial_properties.present?
        flash[:notice] = "No Properties matching this criteria were found"
        redirect_to :back
     end 
  end

  def show
  end

  def new
    @commercial_property = CommercialProperty.new
  end

  def edit
  end

  def create
    @commercial_property = CommercialProperty.new(commercial_property_params)

    respond_to do |format|
      if @commercial_property.save
        format.html { redirect_to @commercial_property, notice: 'Commercial property was successfully created.' }
        format.json { render :show, status: :created, location: @commercial_property }
      else
        format.html { render :new }
        format.json { render json: @commercial_property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @commercial_property.update(commercial_property_params)
        format.html { redirect_to @commercial_property, notice: 'Commercial property was successfully updated.' }
        format.json { render :show, status: :ok, location: @commercial_property }
      else
        format.html { render :edit }
        format.json { render json: @commercial_property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @commercial_property.destroy
    respond_to do |format|
      format.html { redirect_to commercial_properties_url, notice: 'Commercial property was successfully destroyed.' }
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
    
    def set_commercial_property
      @commercial_property = CommercialProperty.find(params[:id]) if params[:id].present?
    end

    def commercial_property_params
      params.require(:commercial_property).permit(:landlord_id,:street_name,:island_id,:num_bathrooms,:monthly_amt,:description,:category_id,:num_units)
      #params.fetch(:commercial_property, {})
    end
end
