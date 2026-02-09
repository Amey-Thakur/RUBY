require 'erb'
require_relative 'data'

# The Build Script: Translating Art into Interaction
def build_website
  template_path = 'web/templates/index.html.erb'
  output_path = 'web/index.html'
  
  puts "🚀 Initializing Ruby Build System..."
  
  # Load the professional ERB template
  template = File.read(template_path)
  renderer = ERB.new(template)
  
  # Inject data and generate high-fidelity HTML
  puts "🎨 Rendering Curriculum Grid (30 Modules)..."
  html_content = renderer.result(binding)
  
  # Write the production artifact
  File.write(output_path, html_content)
  
  puts "✅ Build Complete! Production artifact saved to: #{output_path}"
end

build_website if __FILE__ == $0
