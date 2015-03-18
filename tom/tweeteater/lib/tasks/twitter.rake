# rake twitter:clear
namespace :twitter do
  desc "Clear the user and tweet tables"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  # This will create the specified amount of users (and their tweets).
  desc "Creates test data with smart-people-talk tweets"
  task :posts, [:user_count] => :environment do |t, args|
    # The square brackets above mean that this task can accept a parameter from the user.
    # t is the task itself, args is all of the user's arguments.
    FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
  end

  # This should get actual tweets coming from Twitter itself.
  desc "Search Twitter for a query and a number of tweets"
  task :search, [:query, :limit] => :environment do |t, args|
    # Homework goes here.
    Tweet.destroy_all
    ApplicationController.twitter.search(args[:query]).take(args[:limit].to_i).each do |tweet|
      Tweet.create(:post => tweet.text)
    end
  end
end

# Probably want a gem to do this.
# Gem has changed a lot in the last couple of months, not all documentation is relevant.
# Twitter Streaming API - IGNORE THIS.
