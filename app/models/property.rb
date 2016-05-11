class Property < ActiveRecord::Base
  
  def property_name
    name = "#{self.num_bedrooms}  #{self.num_bathrooms} #{self.street_name}"
  end
end
