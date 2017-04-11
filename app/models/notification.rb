class Notification < ApplicationRecord
    enum object_type: [:chore_approval, :reward_approval, :new_chore, :chore_approved, :reward_approved, :new_reward]
    enum user_type: [:parent_user, :child]
    
    
    
    def self.new_chore_approval(chore_id, parent_id)
        Notification.create(:unread => true, :object_type => :chore_approval, :object_id => chore_id, :user_type => :parent_user, :user_id => parent_id)
    end
    
    def self.new_reward_approval(reward_id, parent_id)
        Notification.create(:unread => true, :object_type => :reward_approval, :object_id => reward_id, :user_type => :parent_user, :user_id => parent_id)
    end
    
    def self.new_chore(chore_id, child_id)
        Notification.create(:unread => true, :object_type => :new_chore, :object_id => chore_id, :user_type => :child, :user_id => child_id)
    end
    
    def self.chore_approved(chore_id, child_id)
        Notification.create(:unread => true, :object_type => :chore_approved, :object_id => chore_id, :user_type => :child, :user_id => child_id)
    end
    
    def self.reward_approved(reward_id, child_id)
        Notification.create(:unread => true, :object_type => :reward_approved, :object_id => reward_id, :user_type => :child, :user_id => child_id)
    end
    
    def self.new_reward(reward_id, child_id)
        Notification.create(:unread => true, :object_type => :new_reward, :object_id => reward_id, :user_type => :child, :user_id => child_id)
    end
    
    def self.mark_read(notif_id)
        Notification.find(notif_id).update(:unread => false)
    end
    
    def self.mark_unread(notif_id)
        Notification.find(notif_id).update(:unread => true)
    end
end
