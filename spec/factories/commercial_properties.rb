FactoryGirl.define do
  factory :commercial_property do
    category_id {rand(1..2)}
    island_id {rand(1..18)}
    street_name {FFaker::Address.street_name}
    square_feet {rand(250..20000)}
    num_bathrooms {rand(1..5)} 
    num_units {rand(1..5)}
    monthly_amt {rand(1000..25000)}
    description {FFaker::Lorem.sentence}
  end
end
