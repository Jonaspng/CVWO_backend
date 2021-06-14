# This file is used by Rack-based servers to start the application.
require_relative "config/environment"

run Rails.application
require 'rack/cors'
use Rack::Cors do
    allow do
      origins 'https://todolist-cvwo.herokuapp.com/'
      resource '*', 
      headers: :any, 
      methods: [:get, :post, :patch, :put, :delete], 
      credentials: true
    end
  end
Rails.application.load_server

