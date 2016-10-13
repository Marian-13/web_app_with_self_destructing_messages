require_relative './bootstrap_utils'
include BootstrapUtils

require_relative './path_helpers'
include PathHelpers
generate_css_links
generate_js_scripts

require_relative './password_helpers'
# include PasswordUtils

require_relative './user_helpers'

def super_log(object, string='')
  5.times { puts '-----------------------------------------------------------' }
  p string unless string.empty?
  p object
  5.times { puts '-----------------------------------------------------------' }
end
