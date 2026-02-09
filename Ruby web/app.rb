require 'bundler/setup'
Bundler.require(:default)
require 'sinatra'
require 'commonmarker'
require 'json'
require 'fileutils'

# Dynamic Source Code Explorer logic
module RubyChallenge
  # Source Code is in the parent directory of 'Ruby web'
  SOURCE_DIR = File.expand_path('../Source Code', __dir__)

  CURRICULUM_DATA = [
    { day: 1, topic: "Installation, Variables & User Input", category: "basics" },
    { day: 2, topic: "Methods and Conditional if-else", category: "basics" },
    { day: 3, topic: "Classes and Objects", category: "basics" },
    { day: 4, topic: "Getter, Setter and to_s Method", category: "basics" },
    { day: 5, topic: "Class Variable and Self Method", category: "basics" },
    { day: 6, topic: "Loops", category: "logic" },
    { day: 7, topic: "Break, Next and Redo Statement", category: "logic" },
    { day: 8, topic: "Block and Yield", category: "logic" },
    { day: 9, topic: "Module Concept with Class", category: "modular" },
    { day: 10, topic: "Require & Include Statement", category: "modular" },
    { day: 11, topic: "Array Basics", category: "modular" },
    { day: 12, topic: "2D Arrays", category: "modular" },
    { day: 13, topic: "Hash", category: "modular" },
    { day: 14, topic: "Random Numbers and Menu Class", category: "modular" },
    { day: 15, topic: "Inheritance", category: "advanced" },
    { day: 16, topic: "Operator Overloading", category: "advanced" },
    { day: 17, topic: "Freezing Objects", category: "advanced" },
    { day: 18, topic: "Proc and Lambda", category: "advanced" },
    { day: 19, topic: "Arity Method", category: "advanced" },
    { day: 20, topic: "Date and Time", category: "advanced" },
    { day: 21, topic: "TicTacToe Game", category: "interactive" },
    { day: 22, topic: "Hangman Game", category: "interactive" },
    { day: 23, topic: "Rails: Installation & Intro", category: "rails" },
    { day: 24, topic: "Rails: Website Development", category: "rails" },
    { day: 25, topic: "Rails: CRUD Database", category: "rails" },
    { day: 26, topic: "Rails: Bootstrap Styling", category: "rails" },
    { day: 27, topic: "Rails: Devise Auth", category: "rails" },
    { day: 28, topic: "Rails: User Associations", category: "rails" },
    { day: 29, topic: "Rails: List Styling", category: "rails" },
    { day: 30, topic: "Rails: Cloud Deployment", category: "rails" }
  ]

  def self.processed_curriculum
    CURRICULUM_DATA.map do |day_info|
      day_folder_name = day_info[:day] >= 23 ? "Day 23-30" : "Day #{day_info[:day]}"
      day_folder_path = File.join(SOURCE_DIR, day_folder_name)
      
      files = []
      if Dir.exist?(day_folder_path)
        # Use absolute glob and then strip the base path for display
        # Handle both forward and backslashes for Windows
        search_pattern = File.join(day_folder_path, '**', '*.{rb,md,txt}')
        all_files = Dir.glob(search_pattern.gsub('\\', '/'))
        files = all_files.reject { |f| File.directory?(f) }.map do |f|
          # Robust path cleaning
          clean_path = f.gsub(day_folder_path.gsub('\\', '/'), '')
          clean_path.sub(/^[\/\\]/, '')
        end
      end
      
      day_info.merge(files: files, folder_path: "Source Code/#{day_folder_name}")
    end
  end
end

# Sinatra Configuration
set :port, 4567
set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'
set :protection, false # Disable protection for local development to allow serving assets from parent directories

# Routes
get '/' do
  @curriculum = RubyChallenge.processed_curriculum
  erb :index
end

# Serve assets from parent directories using File.read to bypass send_file restrictions
get '/docs/*' do
  path = params[:splat].first
  file_path = File.expand_path(File.join(__dir__, '..', 'docs', path))
  if File.exist?(file_path)
    content_type File.extname(file_path)
    File.binread(file_path) # Use binread for images
  else
    status 404
  end
end

get '/Mega/*' do
  path = params[:splat].first
  file_path = File.expand_path(File.join(__dir__, '..', 'Mega', path))
  if File.exist?(file_path)
    content_type File.extname(file_path)
    File.binread(file_path) # Use binread for images
  else
    status 404
  end
end

# Route to render README.md content as formatted Markdown
get '/manifesto' do
  # Read README.rb from the current directory
  readme_path = File.join(__dir__, 'README.rb')
  
  if File.exist?(readme_path)
    # Execute the Ruby script and capture its output
    # This fulfills the "entirely in Ruby" requirement while maintaining rendering logic in one place
    @manifesto_content = `ruby "#{readme_path}"`.force_encoding('UTF-8')
    
    if @manifesto_content.strip.empty?
      @manifesto_content = "<h1>Error: README.rb execution produced no output</h1>"
    end
  else
    @manifesto_content = "<h1>Error: README.md not found at #{readme_path}</h1>"
  end
  
  erb :manifesto
end

# Global 404 Handler
not_found do
  status 404
  erb :'404'
end
