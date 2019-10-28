require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require "pry" if development? || test?
require_relative 'config/application'
require "faker"
require 'sinatra/activerecord'

set :bind, '0.0.0.0'  # bind to all interfaces

configure do
  set :views, 'app/views'
end

enable :sessions

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  redirect '/parties'
end

get '/parties' do
  @parties = Party.all
  erb :'parties/index'
end

get '/party/:id' do
  @parties = Party.all
  @parties.each do |party|
    if party["id"] == params["id"].to_i
      @party = party
    end
  end
    @guest_list = []
    @guests = Guest.all
    @guests.each do |guest|
      if guest['party_id'] == params['id'].to_i
        @guest_list << guest
      end
    end
    @friends = Friend.all.sort_by { |a| a[:first_name][0] }
    erb :'parties/show'
end

get '/parties/new' do
  erb :'parties/new'
end


post "/parties/new" do
  flash[:name] =  params["name"]
  flash[:description] =  params["description"]
  flash[:location] =  params["location"]

  new_party = Party.new
  new_party["name"] =  params["name"]
  new_party["description"] =  params["description"]
  new_party["location"] =  params["location"]

  if new_party.save
    flash[:notice] = "Successfully Posted!"
    redirect "/parties"
  else
    error = new_party.errors.full_messages.join(', ')
    flash[:notice] = error
    redirect "/parties/new"
  end
end


get '/friends' do
  @friends = Friend.all
  erb :'friends/friend_index'
end

get '/friends/new' do
  erb :'friends/friend_new'
end

post "/friends/new" do
  flash[:first_name] = params["first"]
  flash[:last_name] = params["last_name"]

  new_friend = Friend.new
  new_friend["first_name"] = params["first_name"]
  new_friend["last_name"] = params["last_name"]
  if new_friend.save
    flash[:notice] = "Successfully Posted!"
    redirect "/friends"
  else
    error = new_friend.errors.full_messages.join(', ')
    flash[:notice] = error
    redirect "/friends/new"
  end
end

post '/party/:id' do
    new_guest = Guest.new(friend_id: params["friend"].to_i, party_id: params["id"].to_i)
    new_guest.save
    redirect "/party/#{params["id"]}"
end
