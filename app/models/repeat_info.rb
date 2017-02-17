class RepeatInfo < ApplicationRecord
    belongs_to :chore
    enum repeat_type: {daily: 0, weekly: 1, monthly: 2}
end
