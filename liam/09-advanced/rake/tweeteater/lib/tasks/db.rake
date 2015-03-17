namespace :db do
  desc "Drop, Create and Remigrate the Database"
  # Make a task depend on the :environment task
  task :regenerate => :environment do
    User.destroy_all
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end
end