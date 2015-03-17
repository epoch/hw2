#rake twitter:clear
namespace :twitter do 
  desc "Clears the user and tweet tables"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  desc "Creates test data with fake Latin tweets"
  task :posts, [:user_count] => :environment do |t, args|
    FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
  end

  desc "Search Twitter for a query and a number of tweets"
  task :search, [:query, :limit] => :environment do |t, args|
    $twitter.search(args[:query]).take(args[:limit].to_i).collect do |tweet|
      message = tweet.text
      Tweet.create :post => message
    end
  end
end