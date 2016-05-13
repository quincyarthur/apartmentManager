FactoryGirl.define do
  factory :tenant do
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    email {FFaker::Internet.email }
    password "MyPassword1234"
    password_confirmation "MyPassword1234"
    phone_number 4321473
  end
end
