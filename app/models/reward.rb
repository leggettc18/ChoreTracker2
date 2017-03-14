class Reward < ApplicationRecord
    belongs_to :parent
    scope :not_purchased, -> { where(:child_id => nil) }
end
