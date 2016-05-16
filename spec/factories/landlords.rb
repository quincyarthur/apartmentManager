FactoryGirl.define do
  factory :landlord do
    name {FFaker::Company.name}
    email {FFaker::Internet.email }
    password "Welcome1"
    password_confirmation "Welcome1"
    subscription_id {rand(1..2)}
    phone_number {FFaker::PhoneNumber.short_phone_number} 
    
    factory :landlord_with_properties_tenants_with_leases do
      transient do
       properties_count {rand(1..5)}
      end
       
      after(:create) do |landlord, evaluator|
          evaluator.properties_count.times do
            create(:property,landlord: landlord) do |property|
              rand(1..5).times do
                x=0
                arr = (1..15).to_a.shuffle
                create(:propertyAmenity, property: property,amenity_id: arr[x].to_i)
                x+=1
              end
              create(:tenant) do |tenant|
                create(:tenant_rent_detail, property: property,tenant:tenant) 
              end
            end
          end
      end    
    end  
  end  
end

    