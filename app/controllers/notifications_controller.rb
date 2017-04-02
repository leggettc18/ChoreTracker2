class NotificationsController < ApplicationController
    before_action :authenticate_parent!
    
    def index
        Notification.new_chore(5, current_parent.id)
        Notification.new_reward(1, current_parent.id)
        @notifications = Notification.where(parent_id: current_parent.id)
    end
    
    private
    
    def notification_params
        params.fetch(:notifications, {}).permit(:unread, :type, :object_id, :parent_id)
    end
end
