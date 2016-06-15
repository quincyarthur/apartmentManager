class ProspectiveTenantsController < ApplicationController
  
  def new 
    
  end
  
  def create

    @prospective_tenant = ProspectiveTenant.new(prospective_tenants_params)
    @id = @prospective_tenant.property_id
    if @prospective_tenant.save
      flash[:success] = 'Appointment Created'
      redirect_to :back
      #redirect_to controller: 'residential_properties', action: 'show', id: @id
    else
      flash[:notice] = 'Error Creating Appointment'
      redirect_to :back
    end
  end
  
  private

    def prospective_tenants_params
      params.require(:prospective_tenant).permit(:property_id,:name,:phone_number,:appointment_date)
    end
end
