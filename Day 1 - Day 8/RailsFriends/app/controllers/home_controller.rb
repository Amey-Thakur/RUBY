class HomeController < ApplicationController
  def index
  end

  def about
    @about_me = "My Name is Amey Thakur..."
    @GitHub = "https://github.com/Amey-Thakur"
    @LinkedIn = "https://www.linkedin.com/in/amey-thakur"
    @Twitter = "https://twitter.com/iameythakur"
  end
  
end
