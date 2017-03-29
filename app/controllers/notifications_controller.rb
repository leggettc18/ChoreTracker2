class NotificationsController < ApplicationController
    before_action :authenticate_parent!
    
    def index
        @notifications = Notification.find_by_parent_id(current_parent)
    end
end
