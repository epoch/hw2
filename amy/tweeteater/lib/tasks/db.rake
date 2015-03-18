namespace :db do 
  desc "Drop, create, and remigrate the DATABASE"
  #dpeending on the environment makes your task be loaded into memory first
  #any time you want a rake task to wokr with your environment, you have to depend on the 
  #environment task
  task :regenerate => :environment do
    # User.destroy_all

    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke  
    Rake::Task['db:migrate'].invoke  
  end
end