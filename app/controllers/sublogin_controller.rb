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
                redirect_to :back, notice: 'Specified parent PIN was wrong'
            else #Sublogin successfull
                returnplace = session.delete(:return_to)
                if returnplace != nil
                    redirect_to returnplace
                else
                    redirect_to "/", notice: "Parent login successful"
                end
            end
            
        elsif (type == 'child')
            result = trySubLogin("child", id, pin, false)
            if result == false #Sublogin failed
                redirect_to :back, notice: 'Child PIN incorrect'
            else #Sublogin successfull
                returnplace = session.delete(:return_to)
                if returnplace != nil
                    redirect_to returnplace
                else
                    redirect_to "/children/" + id.to_s
                end
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
                    redirect_to "/", notice: 'Parent PIN successfully updated'
                    puts "Successfully updated subaccount with new PIN"
                else #New pin mismatch
                    puts "Pin change failed for parent ID " + parent[:id].to_s + " because the new PIN and confirmation were different"
                    redirect_to :back, notice: 'New PIN confirmation did not match'
                end
            else #Wrong current pin
                puts "Pin change failed for parent ID " + parent[:id].to_s + " because of invalid existing pin"
                redirect_to :back, notice: 'Specified current PIN was wrong'
            end
            
        elsif user[:type] == "child"
            child = Child.find(id)
            curpin = child[:childPin]
            if(curpin == curpinform)
                if (newpin == newpinconfirm)
                    child[:childPin] = newpin
                    child.save
                    puts "Successfully updated subaccount with new pin"
                    redirect_to "/children/" + id.to_s, notice: 'PIN successfully updated!'
                else #New pin mismatch
                    puts "Pin change failed for child ID " + child[:id].to_s + " because the new pin and confirmation were different"
                    redirect_to :back, notice: 'New PIN confirmation did not match'
                end
            else #Wrong current pin
                puts "Pin change failed for child ID " + child[:id].to_s + " because of invalid existing pin"
                redirect_to :back, notice: 'Specified current PIN was wrong'
            end
            
        else #Aw crap
            throw "INVALID ACCOUNT TYPE"
        end
        #doSubLogout()
        #redirect_to "/sublogin/"
        #redirect_to "/sublogin/pin"
        
    end
    
    def rstPin
        id = params[:sublogin][:child_id]
        child = Child.find_by_id(id.to_i)
        if(child[:parent_id] != current_parent.id)
            redirect_to "/", notice:"FAILURE: Attempt to change PIN on someone else's child"
        else
            child[:childPin] = params[:sublogin][:pin]
            child.save
            redirect_to "/", notice: "Pin for "+child[:name]+" successfully changed."
        end
        
        
        
    end
    
    def autoLoginIfPossible
        puts "Thingsaohoidhj;saodhas;doifhsad;ofijsa;ofijasdf;oiajsdf;oasijdf;odsajfasd;oifjasdfo"
        
        
    end
    
end
