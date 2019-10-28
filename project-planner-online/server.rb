require 'sinatra'
require 'sinatra/flash'
require 'sinatra/activerecord'
require "sinatra/reloader" if development?
require "pry" if development? || test?

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
  redirect '/projects'
end

get '/projects' do
  @projects = Project.all
  erb :'projects/index'
end

get '/project/:id' do
  @projects = Project.all
  @projects.each do |project|
    if project["id"] == params["id"].to_i
      @project = project
    end
  end
  erb :'projects/show'
end
