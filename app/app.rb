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

  before do
    @user = current_user
  end

  get '/' do
    erb :'index'
  end

  get '/users/new' do  #sign up
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(
      name: params[:name],
      email: params[:email],
      handle: params[:handle],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

    session[:user_id] = @user.id
    if @user.save
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/sessions/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @peep = Peep.create(title: params[:title], message: params[:message], user: current_user)
    @peep.save
    redirect '/peeps'
  end


  run! if app_file == $0
end
