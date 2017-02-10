class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :parent
    enum repeat_type: ["No Repeat", "Daily", "Weekly", "Monthly"]
end
