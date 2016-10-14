require_relative 'helpers/all_helpers'

# TODO move to particular file
configure :development do
  options = YAML.load_file('./config/database.yml')
  DataMapper.setup(:default, options['default'])
end

require 'sinatra'
require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'

require_relative 'models/all_models'

# DataMapper.auto_migrate!
DataMapper.finalize

# DataMapper.finalize
# DataMapper.auto_upgrade!

# DataMapper.auto_migrate!


class WebAppWithSelfDestructingMessages < Sinatra::Base
  enable :sessions
  use Rack::Flash

  configure :development do
    enable :logging
  end

  include UserHelpers

  # TODO uncomment
  # ['/users/:id'].each do |rout|
  #   before rout do
  #     authorize
  #   end
  # end

  # root
  get '/' do
    redirect to('/login')
  end


  # SessionsController
  get '/login?:format' do
    if current_user
      # TODO Remove stub
      redirect to("/users/#{current_user.id}")
    else
      erb :'sessions/new.html', layout: :'layouts/application.html'
    end
  end

  post '/login?:format' do
    @user = User.first(email: params[:email].downcase)

    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      # TODO Remove stub
      redirect to("/users/#{@user.id}")
    else
      flash[:notice_failure] = ['Incorrect email or password']
      erb :'sessions/new.html', layout: :'layouts/application.html'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to('/login')
  end


  # UsersController
  get '/signup.?:format?' do
    if current_user
      # TODO Remove stub
      redirect to("/users/#{@user.id}")
    else
      @user = User.new
      erb :'users/new.html', layout: :'layouts/application.html'
    end
  end

  post '/signup' do
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.valid?
      # TODO move password check in PasswordHelpers
      if params[:password].empty?
        @user.errors.add(:password, 'Password must not be blank')
      else
        if params[:password].length < 6
          @user.errors.add(:password, 'Password must be at least 6 characters long')
        else
          if params[:password] != params[:password_confirmation]
            @user.errors.add(:password, 'Password do not match password confirmation')
          end
        end
      end
    end

    if @user.errors.empty?
      @user.password = params[:password]
      @user.save
      session[:user_id] = @user.id
      # TODO Remove stub
      redirect to("/users/#{@user.id}")
    else
      erb :'users/new.html', layout: :'layouts/application.html'
    end
  end

  # Main page
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
