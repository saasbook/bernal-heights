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
  
  factory :admin do
    name                    { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                "password"
    password_confirmation   "password"
    admin                   true
  end

  factory :hotspot do
    location        "479 Prentiss St, San Francisco, CA 94110"
    details         { Faker::Lorem.paragraph }
    report_num      { Faker::Number.number(5) }
    to_share        false
    creator_name    { Faker::Lorem.word }
    creator_email   { Faker::Internet.email }
    creator_number  "123-456-7890"
    walk            false
    occurred_date   { Faker::Date.forward(10) }
    occurred_time   { Faker::Time.forward(10, :evening) }
    region          "North"
    archive         false
    status          "active"
    after(:build) do |hotspot| 
      hotspot.class.skip_callback(:validation, :after, :geocode)
      hotspot.class.skip_callback(:validation, :after, :reverse_geocode)
      hotspot.class.skip_callback(:validation, :after, :add_region)
    end
    # before(:create) do |hotspot| 
    #   hotspot.issues << FactoryGirl.create(:issue, issue_type: issue_type)
    # end
  end
  
  factory :issue do
    issue_type "Car Break-In"
    initialize_with { Issue.find_or_create_by(issue_type: issue_type) }
  end
  
  factory :hotspotissue do
    association :hotspot
    association :issue
  end

end