class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :parent
    enum repeat_type: ["No Repeat", "Daily", "Weekly", "Monthly"]
    enum repeat_weekday: ["None", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    attr_accessor :repeat_weekday
end
