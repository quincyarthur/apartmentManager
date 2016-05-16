class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_filter :require_landlord, :only => [:new,:create,:edit, :update, :delete]

  def index
    @properties = Property.where("category_id = ?",params[:id]).order('created_at desc') #show most recent listings first
    @category_name = Category.find(params[:id]).name
    if @properties.empty?
      flash[:notice] = 'No Properties Found'
      redirect_to root_path
    end
  end

  def show
    @property_landlord = @property.landlord
    @amount_of_interest_shown = @property.prospective_tenants.count
    @prospective_tenant = ProspectiveTenant.new()
  end

  def new
    @property = Property.new
  end
  
  def edit
  end
  
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
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
      @property = Property.find(params[:id])
    end

    def property_params
      params.fetch(:property, {})
    end
end
