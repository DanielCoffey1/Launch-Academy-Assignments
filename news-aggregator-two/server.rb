require 'sinatra'
require 'sinatra/reloader'

configure :development, :test do
  require 'pry'
end


get '/' do
  redirect '/articles'
end

get '/articles' do

  erb :index
end
