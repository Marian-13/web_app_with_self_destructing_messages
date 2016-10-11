require_relative 'helpers/all_helpers'

# TODO
configure :development do
  options = YAML.load_file('./config/database.yml')
  DataMapper.setup(:default, options['default'])
end

require 'sinatra'
require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'

require_relative 'models/user.rb'

class WebAppWithSelfDestructingMessages < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :'sessions/new.html', layout: :'layouts/application.html'
  end

  get '/login?:format' do
    erb :'sessions/new.html', layout: :'layouts/application.html'
  end

  post '/login?:format' do
    # TODO A stub
    redirect to('/messages/index')
  end

  get '/signup.?:format?' do
    @user = User.new
    erb :'users/new.html', layout: :'layouts/application.html'
  end

  post '/signup' do
    @user = User.new(name: params[:name],
                     email: params[:email],
                     password: params[:password])

    flash[:notice_failure] = [] # TODO remove

    if !valid_password_confirmation?(params[:password], params[:password_confirmation])
      flash[:notice_failure] = ['Password do not match password confirmation']
      erb :'users/new.html', layout: :'layouts/application.html'
    else
      if @user.save
        # TODO A stub
        redirect to("/users/#{@user.id}")
      else
        erb :'users/new.html', layout: :'layouts/application.html'
      end
    end
  end

  get '/users/:id.?:format?' do
    @user = User.get!(params[:id])
    erb :'users/show.html', layout: :'layouts/application.html'
  end

  delete '/users/:id' do
    @user = User.get(params[:id])
    @user.destroy
    # TODO A stub
    redirect to("/signup")
  end
end
