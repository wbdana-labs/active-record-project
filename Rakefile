require 'active_record'
require 'pry-byebug'

task :environment do
  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'
end

include ActiveRecord::Tasks
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = 'db/migrate'
seed_loader = Class.new do
  def load_seed
    load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
  end
end
DatabaseTasks.seed_loader = seed_loader.new
load 'active_record/railties/databases.rake'

task :console => :environment do
  Pry.start
end

namespace :db do

  desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('./db/library-development.db'))
    # connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrate/")
  end
  # desc "drop, create, and migrate the db (also sets the environment before migrating)"
  desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('./db/library-development.db'))
    # connection_details = YAML::load(File.open('config/database.yml'))
    File.delete(connection_details.fetch('database')) if File.exist?(connection_details.fetch('database'))
  end

  desc "drop and migrate"
  task :fix => [:drop, :migrate]

end
