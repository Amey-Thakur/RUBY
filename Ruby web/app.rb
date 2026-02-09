require 'sinatra'
require 'json'
require 'fileutils'

# Dynamic Source Code Explorer logic
module RubyChallenge
  SOURCE_DIR = File.expand_path('../../Source Code', __dir__)

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
        all_files = Dir.glob(File.join(day_folder_path, '**', '*.{rb,md}'))
        files = all_files.map { |f| f.sub("#{day_folder_path}/", "") }
      end
      
      day_info.merge(files: files, folder_path: "Source Code/#{day_folder_name}")
    end
  end
end

# Sinatra Configuration
set :port, 4567
set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'

# Routes
get '/' do
  @curriculum = RubyChallenge.processed_curriculum
  erb :index
end

# Dynamic route for fetching source files
get '/source/*' do
  path = params[:splat].first
  full_path = File.join(RubyChallenge::SOURCE_DIR, path)
  
  if File.exist?(full_path) && !File.directory?(full_path)
    content_type 'text/plain'
    File.read(full_path)
  else
    status 404
    "File not found: #{path}"
  end
end

require 'redcarpet'

# Route to render README.rb output as formatted Markdown
get '/manifesto' do
  markdown_content = `ruby README.rb`
  
  # Configure Redcarpet to handle GitHub-style Markdown
  renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: false)
  markdown = Redcarpet::Markdown.new(renderer, 
    autolink: true, 
    tables: true, 
    fenced_code_blocks: true, 
    strikethrough: true,
    superscript: true,
    no_intra_emphasis: true
  )
  
  @manifesto_content = markdown.render(markdown_content)
  erb :manifesto
end

# Global 404 Handler
not_found do
  status 404
  erb :'404'
end
