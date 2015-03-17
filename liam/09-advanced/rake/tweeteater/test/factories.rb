FactoryGirl.define do

  factory :user do |f|
    f.sequence(:name) {Faker::Name.name}
    f.sequence(:email) {Faker::Internet.email}

    # creates a user, and creates tweets, and associates them with the user
    factory :user_with_tweets do |f|
     after(:create) do |u|
        #after creating the user, it will create a tweet, a random number of tweets
        # and all of these tweets are associated with the user
        FactoryGirl.create_list :tweet, Random.rand(10..100), :user => u
     end
   end

  end

  factory :tweet do |f|
    f.sequence(:post) {Faker::Hacker.say_something_smart}
  end

end