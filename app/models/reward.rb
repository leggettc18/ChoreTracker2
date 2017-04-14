class Reward < ApplicationRecord
    belongs_to :parent
    scope :made_by_parent, lambda {|parent| where(:parent_id => parent.id) }
    scope :not_purchased, -> { where(:child_id => nil) }
end
