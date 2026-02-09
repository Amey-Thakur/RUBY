require 'erb'
require 'json'
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
    template_content = File.read(template_path)
    
    # Pre-process CURRICULUM_DATA to include all files in the respective Day folders
    processed_curriculum = CURRICULUM_DATA.map do |day_info|
      day_folder = "Source Code/Day #{day_info[:day]}"
      # Handle special Day ranges like 23-30
      day_folder = "Source Code/Day 23-30" if day_info[:day] >= 23
      
      # Collect all .rb and .md files in that directory
      files = []
      if Dir.exist?(day_folder)
        files = Dir.children(day_folder).select { |f| f.end_with?('.rb', '.md') }
      end
      
      day_info.merge(files: files, folder_path: day_folder)
    end

    renderer = ERB.new(template_content)
    
    # Inject data and generate high-fidelity HTML
    # We pass processed_curriculum to the template
    html_content = renderer.result_with_hash(curriculum: processed_curriculum)
    
    # Write the production artifact
    File.write(output_path, html_content)
    puts "✅ Production artifact saved to: #{output_path}"
  end
  
  puts "🎊 Build Process Complete!"
end

build_website if __FILE__ == $0
