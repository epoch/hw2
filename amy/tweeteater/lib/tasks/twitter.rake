#rake twitter:clear
namespace :twitter do 
  desc "Clears the user and tweet tables"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  #task called posts
  desc "Creates test data with fake Latin tweets"
  #by putting this :user_count in square brackets we are saying this task
  #can accept a parameter from the user
  task :posts, [:user_count] => :environment do |t, args|
    #when the user runs this they can pass in a user count 
    #run this command with 100 on the end and it will create 100 users, or any number
    FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
  end
  # rake twitter:posts[50] in the console

  desc "Search Twitter for a query and a number of tweets"
  task :search, [:query, :limit] => :environment do |t, args|
    limit = args[:limit].to_i
    $client.search(args[:query], :result_type => "recent").take(limit).collect do |tweet|
      puts "Handle: #{tweet.user.screen_name}: Post: #{tweet.text}"
      Tweet.create(:post => tweet.text)
    end
  end
  # rake twitter:search["Nike",5] in the console
end

# client.search("to:justinbieber marry me", :result_type => "recent").take(3).collect do |tweet|
#   "#{tweet.user.screen_name}: #{tweet.text}"
# en"


    # $client.search('Nike').take(10).collect do |tweet|
    #   "#{tweet.user.screen_name}: #{tweet.text}"
    # end

#look for a gem to talk to twitter api
#user their gem
#the gem  has changed a lot in last couple of months so some documentation is out of date
#theres a new api called twitter streaming api, which lets you continue to get results, dont use that one


    # FactoryGirl.create_list :user_with_tweets, args[:limit].to_i
    #homework goes here

    # client.search, args(:query,:limit.to_i )

  #   client.search("to:justinbieber marry me", :result_type => "recent").take(3).collect do |tweet|
  # "#{tweet.user.screen_name}: #{tweet.text}"
