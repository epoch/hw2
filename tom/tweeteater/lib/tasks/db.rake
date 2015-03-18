namespace :db do
  desc "Regenerates the database from scratch (drop, create, migrate)."
  # Depending on the environment task means it loads the entire Rails application into memory.
  task :regenerate => :environment do
    User.destroy_all
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end
end