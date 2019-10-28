require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'csv'
set :bind, '0.0.0.0'

get '/' do
  @articles = CSV.readlines('articles.csv', headers: true)

  erb :index
end

get '/new' do
  @articles = CSV.readlines('articles.csv', headers: true)
  erb :new
end

post '/new' do
  CSV.open('articles.csv', "a") do |row|
    row << [params[:title], params[:description], params[:url]]
  end
  redirect '/'
end
