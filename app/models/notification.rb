class Notification < ApplicationRecord
    belongs_to :parents
    enum type: ["Chore", "Reward"]
end
