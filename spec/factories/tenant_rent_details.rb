FactoryGirl.define do
  factory :tenant_rent_detail do
    #tenant_id 1
    #property_id 2 
    rent_due_date Date.today
    lease_start_date Date.new(2016,Random.new.rand(1..12),Random.new.rand(1..27))
    lease_end_date Date.new(2017,Random.new.rand(1..12),Random.new.rand(1..27))
   end
end
