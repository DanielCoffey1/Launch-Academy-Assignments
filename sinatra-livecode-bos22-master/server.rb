require 'sinatra'
require 'pry'
require 'csv'
require_relative 'app/restaurant.rb'

set :bind,'0.0.0.0'  # bind to all interfaces, http://www.sinatrarb.com/configuration.html


get '/restaurants' do
  @restaurants = []
  CSV.foreach('restaurants.csv', headers: true) do |row|
    @restaurants << Restaurant.new(row["id"], row["name"], row["address"], row["description"], row["url"], row["image"])
  end
  binding.pry

  erb :index
end
