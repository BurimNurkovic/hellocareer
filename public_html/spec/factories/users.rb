FactoryGirl.define do 
  factory :user do |u|
    u.email {Faker::Internet.email}
    u.password {Faker::Internet.password(8)}
    u.full_name {Faker::Name.name}
  end
end