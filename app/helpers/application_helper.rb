module ApplicationHelper
    def flash_class(key)
        case key
            when "notice" then "alert alert-info"
            when "alert" then "alert alert-danger"
        end
    end
    
    #Cookie format: {
    #JSON.generate('parent or child', expires, id, persistant)
    
    #VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
    #
    # THESE ARE NOT TESTED YET. USE AT YOUR OWN RISK!
    #
    #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    #Returns the ID and type of the user who is sub logged in as a JSON tuple.
    #If nobody is logged in, returns false
    #Refreshes the expiration time if it's valid and not expired
    def getSubLoggedUser
        if cookies[:sublogin].nil? #They don't even have a cookie! How could they be logged in?
            return false
        end
        unpackedCookie = JSON.parse(cookies[:sublogin])
        type = unpackedCookie[0]
        expiration = unpackedCookie[1]
        id = unpackedCookie[2]
        persistant = unpackedCookie[3]
        
        if (expiration <=> DateTime.now) == 1 #cookie is still valid
        
            #Reset cookie expiration
            if(persistant) #The cookie is set to not expire for a long time
                cookies[:sublogin] = {
                  value: JSON.generate([type, 1.year.from_now, id, true]),
                  expires: 1.year.from_now
                }
            else #Normal cookie expiration time. Maybe this will can be changed later to have different times for parents and children
                cookies[:sublogin] = {
                  value: JSON.generate([type, 5.minutes.from_now, id, false]),
                  expires: 5.minutes.from_now
                }
            end
        
        
            if(type == 'parent' or type == 'child')
                return {
                    type: type,
                    id: id
                }
            else
                throw "Invalid account type in cookie!"
            end
            
        else #Gross! An expired cookie. Better throw it away
            cookies.delete :sublogin
            return false
        end
        
        #if cookie[:sublogin]
    end
    
    #Attempts to log in the selected parent or child using the pin provided.
    #Type is "parent" or "child"
    #id is their database identifies
    #pin is obviously the pin
    #returns true if login information is correct, false otherwise.
    #sets cookie automatically if information is correct
    #Returns true if the login was successful, false otherwise
    #WARNING: THIS FUNCTION DOES NOT CURRENTLY ENFORCE LOGGING IN FOR ONLY THE FAMILY LOGGED IN WITH DEVISE
    #WARNING: THIS FUNCTION DOES NOT CURRENTLY ENFORCE LOGGING IN FOR ONLY THE FAMILY LOGGED IN WITH DEVISE
    #WARNING: THIS FUNCTION DOES NOT CURRENTLY ENFORCE LOGGING IN FOR ONLY THE FAMILY LOGGED IN WITH DEVISE
    def trySubLogin(type, id, pin, stayLoggedIn)
        allowLogin = false #Parent and child cookie have same format. DRY
        if type == "parent"
            if pin == Parent.find(id)[:pincode]
                allowLogin = true
            end
        elsif type == "child"
            if pin == Child.find(id)[:childPin]
                allowLogin = true
            end
        else
            throw "Invalid account type passed for login! Valid types are 'parent' or 'child'"
        end
        
        if allowLogin
            expiration = 20.minutes.from_now #stayLoggedIn == false
            if stayLoggedIn
               expiration = 1.year.from_now 
            end
            cookies[:sublogin] = JSON.generate([type, expiration, id, stayLoggedIn])
            return true
        else
            return false
        end
            
    end
    
    #This logs parents or children out if they are logged in. If nobody is sub logged in this does nothing.
    def doSubLogout()
        cookies.delete :sublogin
    end
    
end
