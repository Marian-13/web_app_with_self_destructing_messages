# It is mandatory to place `Bundler.require` above
# require_relative 'web_app_with_self_destructing_messages'
require 'bundler'
Bundler.require

# Some servers supported by Faye, such as Passenger, use a multi-process model
# rather than using threads or events in the same process. For those servers,
# the default in-memory engine will not work; you should use a multi-process
# engine such as the Redis backend.
require 'faye'
# use Faye::RackAdapter, mount: '/faye', timeout: 25
run Faye::RackAdapter.new(mount: '/faye', timeout: 25)

require_relative 'web_app_with_self_destructing_messages'
run WebAppWithSelfDestructingMessages
