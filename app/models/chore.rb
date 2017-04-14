class Chore < ApplicationRecord
    validates  :name, :coins, :due_date, :presence => true
    validates :repeat_until, :presence => true, :if => :repeated
    belongs_to :child
    belongs_to :parent
    scope :overdue, -> { where('due_date < ?', DateTime.now) }
    scope :due_this_week, -> { where(:due_date => DateTime.now..DateTime.now + 7) }
    scope :made_by_parent, lambda {|parent| where(:parent_id => parent.id) }
    enum repeat_type: ["No Repeat", "Daily", "Weekly", "Monthly"]
    enum repeat_weekday: ["None", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    attr_accessor :repeat_weekday



    private
    def repeated
        if repeat_type != "No Repeat"
            return true
        else
            return false
        end
    end

end

