class CommercialPropertiesController < ApplicationController
  before_action :set_commercial_property, only: [:show, :edit, :update, :destroy]
  before_filter :require_landlord, :only => [:new,:create,:edit, :update, :delete]

  def index
    @commercial_properties = CommercialProperty.all
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
      params.fetch(:commercial_property, {})
    end
end
