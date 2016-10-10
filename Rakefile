require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './web_app_with_self_destructing_messages'

namespace :db do
  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end
