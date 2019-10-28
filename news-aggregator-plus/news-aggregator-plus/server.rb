require 'sinatra'
require 'sinatra/reloader'
require 'pry'


set :bind, '0.0.0.0'  # bind to all interfaces


get "/" do
  erb :index
end

require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'csv'
require_relative 'models/article.rb'

set :bind, '0.0.0.0'

def make_articles_array
 @articles = []
 CSV.foreach('articles.csv', headers: true) do |row|
   @articles << Article.new(row["id"], row["article_title"], row["url"], row["description"])
 end
 @articles
end

get "/articles" do
 @articles = make_articles_array


erb :index
end

get '/article/:id' do
 article = make_articles_array
 @articles.each do |article|
   if article.id == params["id"]
     @article = article
   end
 end
end
