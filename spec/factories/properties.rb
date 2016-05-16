FactoryGirl.define do
  factory :property do
    street_name {FFaker::Address.street_name}
    num_bedrooms {rand(1..5)} 
    num_bathrooms {rand(1..5)} 
    num_units {rand(1..5)} 
    monthly_amt {rand(400..2500)}
    category_id {rand(1..2)}
    island_id {rand(1..18)}
    description {FFaker::Lorem.sentence}
    amount_of_interest_shown {rand(1..25)}
  end
end
