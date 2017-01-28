ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set    :session_secret, 'super secret'

  register Sinatra::Flash

  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'index'
  end

  get '/users/new' do  #sign up
    erb :'users/new'
  end

  post '/users' do
   user = User.new(
     name: params[:name],
     email: params[:email],
     handle: params[:handle],
     password: params[:password],
     password_confirmation: params[:password_confirmation])

     session[:user_id] = user.id
   if user.save
     redirect '/'
  #  else
  #    flash[:error] = user.errors.full_messages
  #    redirect '/users/new'
  #  end
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
