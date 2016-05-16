FactoryGirl.define do
  factory :tenant do
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    email {FFaker::Internet.email }
    password "Welcome1"
    password_confirmation "Welcome1"
    phone_number {FFaker::PhoneNumber.short_phone_number}    
  end
end
