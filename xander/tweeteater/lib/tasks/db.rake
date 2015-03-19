namespace :db do
  desc "Drop, create and migrate database"
  # Adding :environment allows you to use other sections of the Rails app. 
  # You could access the models if you wanted to perform actions on them.
  task :regenerate => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end
end