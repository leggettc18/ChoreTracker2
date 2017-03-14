class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :parent
    
    def completed?
        !completed_at.blank?
    end
    
    scope :overdue, -> { where('due_date < ?', DateTime.now) }
    scope :due_this_week, -> { where(:due_date => DateTime.now..DateTime.now + 7) }
    scope :made_by_parent, lambda {|parent| where(:parent_id => parent.id) }
    enum repeat_type: ["No Repeat", "Daily", "Weekly", "Monthly"]
    enum repeat_weekday: ["None", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    attr_accessor :repeat_weekday
end
