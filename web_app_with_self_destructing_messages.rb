require_relative 'helpers/bootstrap_utils'
require_relative 'helpers/path_utils'

require 'sinatra'
require 'sinatra/base'

configure :development do
  DataMapper.setup(:default, 'postgres://marian:cantaccessdatabase@localhost/web_app_with_self_destructing_messages')
end

require 'data_mapper'

require_relative 'models/user.rb'

DataMapper.auto_migrate! # TODO where to place?

class WebAppWithSelfDestructingMessages < Sinatra::Application
  enable :sessions

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

  get '/signup?:format' do
    erb :'users/new.html', layout: :'layouts/application.html'
  end

  post '/signup?:format' do
    @user = User.new(name: params[:name], email: params[:email])
    @user.save

    # TODO A stub
    redirect to('/messages/index')
  end

  get '/messages/index' do
    # TODO A stub
    erb :'messages/index.html'
  end
end
