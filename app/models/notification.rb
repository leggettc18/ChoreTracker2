class Notification < ApplicationRecord
    belongs_to :parents
    has_one :chores
    has_one :rewards
    enum object_type: [:chore, :reward]
    
    
    
    def self.new_chore(chore_id, parent_id)
        Notification.create(:unread => true, :object_type => :chore, :object_id => chore_id, :parent_id => parent_id)
    end
    
    def self.new_reward(reward_id, parent_id)
        Notification.create(:unread => true, :object_type => :reward, :object_id => reward_id, :parent_id => parent_id)
    end
end
