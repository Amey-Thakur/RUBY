require 'erb'
require_relative 'data'

# The Build Script: Translating Art into Interaction
def build_website
  pages = {
    'web/templates/index.html.erb' => 'web/index.html',
    'web/templates/404.html.erb' => 'web/404.html'
  }
  
  puts "🚀 Initializing Ruby Build System..."
  
  pages.each do |template_path, output_path|
    puts "🎨 Rendering #{template_path}..."
    
    # Load the professional ERB template
    template = File.read(template_path)
    renderer = ERB.new(template)
    
    # Inject data and generate high-fidelity HTML
    html_content = renderer.result(binding)
    
    # Write the production artifact
    File.write(output_path, html_content)
    puts "✅ Production artifact saved to: #{output_path}"
  end
  
  puts "🎊 Build Process Complete!"
end

build_website if __FILE__ == $0
