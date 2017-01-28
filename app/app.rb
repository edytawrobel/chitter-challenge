ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'datamapper_setup'


class Chitter < Sinatra::Base

  # enable :sessions
  # set    :session_secret, 'super secret'

  #register Sinatra::Flash

  get '/' do
    erb :'index'
  end

  get '/users/new' do  #sign up
    erb :'users/new'
  end

  post '/users' do
    
  end

  # post '/login' do
  #   erb :'login'
  # end
  #
  # get '/logout' do
  #   erb :'logout'
  # end
  #
  # post '/send_message' do
  #   erb :'send_message'
  # end
  #
  # get '/display_all' do
  #   erb :'display_all'
  # end


  run! if app_file == $0
end
