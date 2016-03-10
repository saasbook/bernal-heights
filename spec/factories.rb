require 'faker'
FactoryGirl.define do
  factory :event do
    name            { Faker::Lorem.word }
    start_date      { Faker::Date.forward(10) }
    start_time      { Faker::Time.forward(10, :evening) }
    end_date        { Faker::Date.between(10.days.from_now, 11.days.from_now) }
    end_time        { Faker::Time.between(10.days.from_now, 11.days.from_now) }
    location        { Faker::Address.street_address }
    description     { Faker::Lorem.paragraph }
    creator_name    { Faker::Name.name }
    creator_email   { Faker::Internet.email }
    event_organizer { Faker::Name.name }
  end
  
  factory :user do
    email                   { Faker::Internet.email }
    password                "password"
    password_confirmation   "password"
    confirmed_at            Date.today
    
    factory :admin do
    admin                   true
    end
  end

end