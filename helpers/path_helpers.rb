module PathHelpers
  # TODO refactor

  def generate_css_links
    Dir.entries("public/stylesheets").each do |entry|
      # TODO add scss sacc less support
      match_data = /[a-z]+.css\z/.match(entry)

      if match_data
        define_method "#{match_data.to_s[0..-5]}_css_link" do
          "<link href=\"/stylesheets/#{match_data.to_s}\" rel=\"stylesheet\">"
        end
      end
    end
  end

  def generate_js_scripts
    Dir.entries("public/javascripts").each do |entry|
      # TODO coffescript jsx support
      match_data = /[a-z]+.js\z/.match(entry)

      if match_data
        define_method "#{match_data.to_s[0..-4]}_js_script" do
          "<script src=\"/javascripts/#{match_data.to_s}\"></script>"
        end
      end
    end
  end

  # def rout_specific_css_link()
  #   match_data = /views\/\w+\/\z/.match(__FILE__)
  #   method(match_data.to_s[6..-2]).call
  # end
end
