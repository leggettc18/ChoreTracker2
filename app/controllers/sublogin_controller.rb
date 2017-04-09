class SubloginController < ApplicationController
    before_filter :authenticate_parent!
    
    def sublogin #Not 100% done yet. The form still need stay logged option, also a better interface
        puts "Beginning sublogin attempt"
        type = params[:sublogin][:type]
        id = params[:sublogin][:child_id].to_i #Not checked for parent. Use devise data.
        pin = params[:sublogin][:pin]
        
        puts "SUBLOGIN: Got data of type: " + type + " and id of " + id.to_s + " and a pin of " + pin
        
        #This would be better if we verified that the child belonged to the parent
        if (type == 'parent')
            result = trySubLogin("parent", current_parent[:id], pin, false)
            if result == false #Sublogin failed
                redirect_to "/sublogin/"
            else #Sublogin successfull
                redirect_to :back  
            end
        elsif (type == 'child')
            result = trySubLogin("child", id, pin, false)
            if result == false #Sublogin failed
                redirect_to "/sublogin/"
            else #Sublogin successfull
                redirect_to "/children/" + id.to_s
            end
        else #Malformed input
            throw "invalid account type"
        
        end
    end
    
    def chgPin
        puts "Beginning attempt to change pin"
        user = getSubLoggedUser()
		id = user[:id].to_i
        
        curpinform = params[:sublogin][:pin]
        newpin = params[:sublogin][:newpin] #This isn't length checked.
        newpinconfirm = params[:sublogin][:newpin2]
        
        
        if user[:type] == "parent"
            parent = Parent.find(id)
            curpin = parent[:pincode]
            if(curpin == curpinform)
                if (newpin == newpinconfirm)
                    parent[:pincode] = newpin
                    parent.save
                    puts "Successfully updated subaccount with new pin"
                else
                    puts "Pin change failed for parent ID " + parent[:id].to_s + " because the new pin and confirmation were different"
                end
            else #It might be nice to let them know the pin change failed on the site
                puts "Pin change failed for parent ID " + parent[:id].to_s + " because of invalid existing pin"
            end
            
        elsif user[:type] == "child"
            child = Child.find(id)
            curpin = child[:childPin]
            if(curpin == curpinform)
                if (newpin == newpinconfirm)
                    child[:childPin] = newpin
                    child.save
                    puts "Successfully updated subaccount with new pin"
                else
                    puts "Pin change failed for child ID " + child[:id].to_s + " because the new pin and confirmation were different"
                end
            else #It might be nice to let them know the pin change failed on the site
                puts "Pin change failed for child ID " + child[:id].to_s + " because of invalid existing pin"
            end
            
        else #Aw crap
            throw "INVALID ACCOUNT TYPE"
        end
        #doSubLogout()
        #redirect_to "/sublogin/"
        #redirect_to "/sublogin/pin"
        redirect_to :back, notice: 'BLEH'
        
    end
    
end
