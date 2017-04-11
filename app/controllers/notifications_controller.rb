class NotificationsController < ApplicationController
    before_action :authenticate_parent!
    
    def index
        # Notification.new_chore_approval(5, current_parent.id)
        # Notification.new_reward_approval(1, current_parent.id)
        # Notification.new_chore(5, current_parent.id)
        # Notification.chore_approved(5, current_parent.id)
        # Notification.reward_approved(1, current_parent.id)
        user = helpers.getSubLoggedUser
        if user == false
            redirect_to :root, notice: "Please log in first"
        elsif user[:type] == 'parent'
            @notifications = Notification.where(user_type: :parent_user, user_id: user[:id])
        else
            @notifications = Notification.where(user_type: :child, user_id: user[:id])
        end
    end
    
    private
    
    def notification_params
        params.fetch(:notifications, {}).permit(:unread, :object_type, :object_id, :user_type, :user_id)
    end
end
