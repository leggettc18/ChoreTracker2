class ApprovalController < ApplicationController
    before_filter :authenticate_parent!
    
      
    def index
        @chores = Chore.all
    end


#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_child
#       @child = Child.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def child_params
#       params.fetch(:child, {}).permit(:name, :balance, :parent_id)
      
#           # params.fetch(:user, {}).permit(:first_name, :last_name, :email, :phone, 
#     end
end
