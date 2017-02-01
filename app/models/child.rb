class Child < ApplicationRecord
    belongs_to :parent
    has_many :chores
end
