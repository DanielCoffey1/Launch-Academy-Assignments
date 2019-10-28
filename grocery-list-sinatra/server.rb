require "sinatra"

require "sinatra/reloader" if development?
require "pry" if development? || test?
require 'csv'



set :bind, '0.0.0.0'  # bind to all interfaces


get "/" do
  redirect to"/groceries"
end

def make_grocery_list_array
  @groceries = []
  CSV.foreach('grocery_list.csv', headers: true) do |row|
    @groceries << row.to_h
  end
  @groceries
end

get "/groceries" do
  @groceries = make_grocery_list_array
  erb :index
end



post "/groceries" do
  if params["name"].empty?
     @error = "Please fill in the form!"
     redirect "/groceries"
   else
     CSV.open('grocery_list.csv', "a") do |row|
       row << [params["name"]]
     end
     redirect "/groceries"
  end
  erb :index
end
