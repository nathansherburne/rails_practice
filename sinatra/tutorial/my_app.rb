require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'erb'
require_relative 'sinatra/helpers'

class MyApp < Sinatra::Base
  helpers Sinatra::UserHelper

  get '/' do
    erb :index
  end

  get '/routes' do
    erb :routes
  end

  get '/users/:username' do
    if params[:username] == 'nathansherburne'
      @username = params[:username]
      erb :user_view
    else
      redirect '/'
    end
  end

  get '/utils/time' do
    erb "<%= Time.now %>"
  end
end

