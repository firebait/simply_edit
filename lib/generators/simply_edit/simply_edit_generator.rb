class SimplyEditGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_javascript
  	copy_file "simply_edit.js", (Rails::VERSION::STRING.starts_with?("3.1") ? "app/assets/javascripts/simply_edit.js" : "public/javascripts/simply_edit.js")        
  end

end
