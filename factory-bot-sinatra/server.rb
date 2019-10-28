require "pry" if development? || test?
require "sinatra"
require "sinatra/activerecord"
require "sinatra/json"
require 'sinatra/flash'
require "sinatra/reloader" if development? || test?

set :bind, '0.0.0.0'
set :database_file, "config/database.yml"

enable :sessions

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get "/recipes.json" do
  recipes = Recipe.all
  recipes.all.map(&:to_hash)
  json recipes
end
