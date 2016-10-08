FactoryGirl.define do
  factory :resume do |r|
    r.title {Faker::Book.title}
    association :user_id, :factory => :user
  end
end