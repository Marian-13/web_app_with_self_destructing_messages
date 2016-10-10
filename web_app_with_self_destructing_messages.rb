require_relative 'helpers/bootstrap_utils'
require_relative 'helpers/path_utils'
require 'sinatra/base'

# class Sinatra::Application
#   alias origin_erb erb
#
#   def erb(template, options = {}, locals = {}, &block)
#     result = method("#{(/\w+\//.match(template.to_s)).to_s[0..-2]}_css_link").call
#     def rout_specific_css_link
#       result
#     end
#
#     origin_erb(template, options = {}, locals = {}, &block)
#   end
# end

class WebAppWithSelfDestructingMessages < Sinatra::Application
  get '/' do
    erb :'sessions/new.html', layout: :'layouts/application.html'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  get '/signup?:format' do
    erb 'app/assets/views/users/new'
  end
end
