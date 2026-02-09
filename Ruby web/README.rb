# frozen_string_literal: true

require 'json'
require 'date'

# ==============================================================================
#            💎 THE RUBY PROGRAMMING CHALLENGE MANIFESTO 💎
# ==============================================================================
# "A disciplined 30-day coding journey where logic meets cinematic beauty."
# ==============================================================================

class RubyChallengeREADME
  def self.render
    header
    authors
    acknowledgments_preview
    overview
    objectives
    metrics
    curriculum
    projects
    structure
    quick_start
    usage
    license
    full_acknowledgments
  end

  def self.header
    puts "\n" + "═" * 80
    puts "  💎  RUBY PROGRAMMING CHALLENGE | AMEY THAKUR & MEGA SATISH  💎".center(80)
    puts "═" * 80
    puts " Status         : 🟢 COMPLETED".center(80)
    puts " Technology     : RUBY | RUBY ON RAILS".center(80)
    puts " Portfolio      : https://Amey-Thakur.github.io/RUBY/".center(80)
    puts "═" * 80 + "\n"
  end

  def self.authors
    puts "[🚀 AUTHORS]"
    puts " • Amey Thakur  : Lead Developer (ORCID: 0000-0001-5644-1575)"
    puts " • Mega Satish  : Logic Architect & Lead Collaborator (ORCID: 0000-0002-1844-9557)"
    puts "-" * 40
  end

  def self.acknowledgments_preview
    puts "\n[🤝 SPECIAL ACKNOWLEDGMENT]"
    puts " Special thanks to Mega Satish for her meaningful contributions, guidance,"
    puts " and support that helped shape this work."
    puts "-" * 40
  end

  def self.overview
    puts "\n[📖 OVERVIEW]"
    puts " Ruby Programming Challenge was conceived as a disciplined collaborative"
    puts " initiative between Amey Thakur and Mega Satish. This project represents"
    puts " the culmination of a disciplined 30-day coding journey, navigating from"
    puts " foundational OOP logic (Day 1) to advanced full-stack web engineering"
    puts " with Ruby on Rails (Day 30)."
    puts "-" * 40
  end

  def self.objectives
    puts "\n[🎯 LEARNING OBJECTIVES]"
    puts " ✅ Object-Oriented Mastery: Modules, mixins, and inheritance."
    puts " ✅ Functional Paradigms: Blocks, Procs, and Lambdas."
    puts " ✅ Full-Stack Agility: Ruby on Rails, MVC, Active Record, and RESTful APIs."
    puts "-" * 40
  end

  def self.metrics
    puts "\n[📊 ACTIVITY & COMMITMENT]"
    puts " • Continuity     : 100% (30/30 Days)"
    puts " • Total Effort   : ~120+ Dedicated Scholarly Hours"
    puts " • Daily Commitment: 4.0+ Hours / Day"
    puts " • Skill Evolution: Novice Syntax ➔ Professional Deployment"
    puts "-" * 40
  end

  def self.curriculum
    puts "\n[📜 30-DAY CURRICULUM]"
    days = [
      "Day 1-5   : Foundations & OOP Basics (Variables, Input, Classes, Self)",
      "Day 6-8   : Control Flow & Logic (Loops, Blocks, Yield)",
      "Day 9-14  : Modular Design & Data (Modules, Requirements, Arrays, Hashes)",
      "Day 15-20 : Advanced OOP & Functional Ruby (Inheritance, Overloading, Lambdas)",
      "Day 21-22 : Interactive Systems (TicTacToe & Hangman Games)",
      "Day 23-30 : Full-Stack Web (Ruby on Rails, CRUD, Devise, Heroku)"
    ]
    days.each { |day| puts " ✅ #{day}" }
    puts "-" * 40
  end

  def self.projects
    puts "\n[🛠️ PROJECTS]"
    puts " • RailsFriends : Friends List App with Rails & SQLite3 persistence."
    puts " • TicTacToe    : Algorithmic game implementation in pure Ruby."
    puts " • Hangman      : Logic-driven lexical processing game."
    puts "-" * 40
  end

  def self.structure
    puts "\n[📁 PROJECT STRUCTURE]"
    tree = <<~TREE
      RUBY/
      ├── docs/                # Documentation Layer
      ├── Mega/                # Attribution Assets
      ├── Source Code/         # Primary Engineering Layer (Day 1-30)
      ├── CITATION.cff         # Citation Manifest
      ├── LICENSE              # MIT License
      └── README.md            # Project Entrance
    TREE
    puts tree
    puts "-" * 40
  end

  def self.quick_start
    puts "\n[⚡ QUICK START]"
    puts " 1. Prerequisites : Ruby 3.0+, Bundler, Git"
    puts " 2. Installation  : git clone https://github.com/Amey-Thakur/RUBY.git"
    puts " 3. Setup         : bundle install"
    puts " 4. Run Example   : cd 'Source Code/Day 22' && ruby Hangman.rb"
    puts "-" * 40
  end

  def self.usage
    puts "\n[📖 USAGE GUIDELINES]"
    puts " • For Students   : A definitive roadmap for mastering semantic Ruby."
    puts " • For Educators  : Modular template for designing intensive bootcamps."
    puts " • For Researchers: Verifiable case study in self-paced technical education."
    puts "-" * 40
  end

  def self.license
    puts "\n[⚖️ LICENSE]"
    puts " MIT License © 2022 Amey Thakur & Mega Satish"
    puts " You are free to share and adapt with appropriate attribution."
    puts "-" * 40
  end

  def self.full_acknowledgments
    puts "\n[🙏 ACKNOWLEDGMENTS]"
    puts " Grateful acknowledgment to Mega Satish for her exceptional collaboration"
    puts " and scholarly partnership. Her intellectual agility, a veritable superpower"
    puts " to rapidly synthesize complex logic and articulate it with clarity, was"
    puts " the driving force behind this project's success. Thank you, Mega."
    puts "═" * 80 + "\n"
  end
end

# Run the Documentation
RubyChallengeREADME.render
