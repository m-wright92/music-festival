require 'rspec'
require 'pg'
require 'actor'
require 'stage'
require 'pry'

DB = PG.connect ({:dbname => 'music_festival_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stages *;")
    DB.exec("DELETE FROM actors *;")
  end
end