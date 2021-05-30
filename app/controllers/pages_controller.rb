class PagesController < ApplicationController

  def home
  end

  def about
    render html: 'About!'
  end
  
end