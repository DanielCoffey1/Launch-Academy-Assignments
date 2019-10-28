require "sinatra"

require "sinatra/reloader" if development?
require "pry" if development? || test?
require 'csv'
require_relative 'app/groceries.rb'


set :bind, '0.0.0.0'  # bind to all interfaces


get "/" do
  redirect "/groceries"
end

def make_grocery_list_array
  @grocery_list = []
  CSV.foreach('grocery_list.csv', headers: true) do |row|
    @grocery_list << Grocery_list.new(row["name"])
  end
  @grocery_list
end

get "/groceries" do
  @groceries = make_grocery_list_array

  erb :index
end

post "/groceries" do
  @error = nil
end

post "/groceries" do
  CSV.open("grocery_list.csv", "a", headers: true) do |csv|
    csv << [params[:name]]
  end

  redirect "/groceries"
end
