require 'sinatra'

get '/' do
  'Hello world'
end

get '/login?:format?' do
  'Login'
end

get '/signup?:format' do
  'Signup'
end
