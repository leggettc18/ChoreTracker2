class DefaultController < ApplicationController
  
  def index
    if parent_signed_in?
    render('home')
   else
    render('index')
   end
  end
  
  def child_door
    if parent_signed_in?
    render('child_door')
   else
    render('index')
   end
     end
  
    def account_door
    if parent_signed_in?
    render('account_door')
   else
    render('index')
   end
     end
  
  

    def do_child
        pin = params[:pin]
  
        if pin == current_parent.pincode
            redirect_to("/children")
         else
            redirect_to("/default/index")
        end
    end
    
    
    
    
       def do_account
        pin = params[:pin]
  
        if pin == current_parent.pincode
            redirect_to("/parents/edit")
         else
            redirect_to("/default/index")
        end
    end
    
    
  
  def change
  end
  
  def do_change
      newpin = params[:pin]
      parent = Parent.find_by_id(current_parent.id)
      parent.pincode = newpin
      parent.save
      redirect_to('/children')
    end
  
  
end
