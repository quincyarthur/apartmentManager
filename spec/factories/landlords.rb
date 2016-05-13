FactoryGirl.define do
  factory :landlord do
    name {FFaker::Company.name}
    email {FFaker::Internet.email }
    password "MyPassword1234"
    password_confirmation "MyPassword1234"
    subscription_id 1
    phone_number 4321473
  end
end
