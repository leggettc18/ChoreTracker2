class Child < ApplicationRecord
 
 #because they dont match, rename
   self.table_name = "children"
 
 
 
     # this fixes something with frozen attribute being shite #ask me if you wanna know -joey
     # http://stackoverflow.com/questions/35299675/activerecorddangerousattributeerror-frozen-is-defined-by-active-record
     
 def self.instance_method_already_implemented?(method_name)
  return true if method_name == 'frozen'
  return true if method_name == 'frozen?'
  super
end


#defining some shortcuts ?

    scope :children, lambda {|query| where(["parent_id = ?", "#{query}"])}




  #      attr_accessor :parent_id
# #   #  attr_accessor :name       ##RUBY ALREADY HAS THEM WOW #
# #     attr_accessor :frozen            ## I was stuck here forever
                                            #
#     attr_accessor :balance
    
    
    
    
    
    
    
    #generated by ryans migrations
    
    belongs_to :parent
    has_many :chores
    
end
