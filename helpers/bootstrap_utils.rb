module BootstrapUtils
  # TODO remove constant
  BOOTSTRAP_CONTAINING_FOLDER = "vendor/bootstrap-3.3.7-dist"

  def css_bootstrap_link
    "<link href=\"/#{BOOTSTRAP_CONTAINING_FOLDER}/css/bootstrap.min.css\" rel=\"stylesheet\">"
  end

  def js_bootstrap_script
    "<script src=\"/#{BOOTSTRAP_CONTAINING_FOLDER}/js/bootstrap.min.js\"></script>"
  end
end

include BootstrapUtils
