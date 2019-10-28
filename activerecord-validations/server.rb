require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require "pry" if development? || test?
require "sinatra/activerecord"
require "./app/models/song"

set :bind, '0.0.0.0'  # bind to all interfaces

configure do
  set :views, 'app/views'
end

enable :sessions

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

helpers do
  def seconds_to_time(sec)
    sec = sec.to_i
    minutes = sec / 60
    seconds = sec % 60
    "#{minutes}:#{seconds.to_s.rjust(2, '0')}"
  end
end

get "/" do
  redirect to("/songs")
end

get "/songs" do
  @songs = Song.all
  erb :songs
end
