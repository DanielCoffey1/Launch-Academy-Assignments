require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'pry'

require_relative "../server"

Capaybara.app = Sinatra::Application
