FactoryGirl.define do
  factory :user do |f|
    f.sequence(:name) { Faker::Name.name }
    f.sequence(:email) { Faker::Internet.email }

    factory :user_with_tweets do |f|
      after(:create) do |u|
        # Create a list of tweets of a random-ish length.
        FactoryGirl.create_list :tweet, Random.rand(10..100), :user => u
      end
    end
  end

  factory :tweet do |f|
    f.sequence(:post) { Faker::Hacker.say_something_smart }
  end
end
