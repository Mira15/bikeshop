FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "passwort123"
    first_name "Peter"
    last_name "Pan"
    admin false
  end

  factory :admin, class: User do
    email
    password "Autobahn123"
    admin true
    first_name "Admin"
    last_name "Awesome"
  end
end