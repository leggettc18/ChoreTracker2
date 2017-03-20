class SubloginController < ApplicationController
    
    def sublogin #Not 100% done yet. The form still need stay logged option, also a better interface
        type = params[:sublogin][:type]
        id = params[:sublogin][:child_id].to_i #Not checked for parent. Use devise data.
        pin = params[:sublogin][:pin]
        
        puts "SUBLOGIN: Got data of type: " + type + " and id of " + id.to_s + " and a pin of " + pin
        
        #This would be better if we verified that the child belonged to the parent
        if (type == 'parent')
            trySubLogin("parent", current_parent[:id], pin, false)
        elsif (type == 'child')
            trySubLogin("child", id, pin, false)
        else #Malformed input
            throw "invalid account type"
        
        end
    end
    
end
