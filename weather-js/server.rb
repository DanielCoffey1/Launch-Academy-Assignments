# A "Proxy API" for accessing DarkSky
require "sinatra"
require "net/http"

require "sinatra/reloader" if development?
require "pry" if development? || test?

set :bind, '0.0.0.0'  # bind to all interfaces

DARK_SKY_API_KEY = "YOUR-API-KEY-HERE"

get "/api/v1/forecast/:latitude,:longitude" do |latitude, longitude|
  uri = URI("https://api.darksky.net/forecast/#{f151b572805fba617f180087686bc13a}/#{latitude},#{longitude}")
  return Net::HTTP.get(uri)
end
