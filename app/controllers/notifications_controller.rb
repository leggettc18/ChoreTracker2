class NotificationsController < ApplicationController
    before_action :authenticate_parent!
    
    def index
        #Notification.new_chore(5, current_parent.id)
        #Notification.new_reward(1, current_parent.id)
        @notifications = Notification.where(user_id: current_parent.id)
    end
    
    private
    
    def notification_params
        params.fetch(:notifications, {}).permit(:unread, :object_type, :object_id, :user_type, :user_id)
    end
end
