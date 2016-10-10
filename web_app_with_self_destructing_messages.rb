require_relative 'helpers/bootstrap_utils'
require_relative 'helpers/path_utils'

require 'sinatra/base'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'web_app_with_self_destructing_messages.sqlite3.db'
)

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
    # TODO A stub
    redirect to('/messages/index')
  end

  get '/messages/index' do
    # TODO A stub
    erb :'messages/index.html'
  end
end
