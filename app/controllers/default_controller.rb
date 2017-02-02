class DefaultController < ApplicationController
  
  def index
    if parent_signed_in?
    
    render('home')
   else
    render('index')
   end
  end
  
end
