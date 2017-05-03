require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
  setup do
    @chore = chores(:Chore_1)
  end
  
  test "overdue" do
    assert_includes Chore.overdue, chores(:Chore_84)
    refute_includes Chore.overdue, chores(:Chore_1)
  end
  
  test "due_this_week" do
    assert_includes Chore.due_this_week, chores(:Chore_1)
    refute_includes Chore.due_this_week, chores(:Chore_36)
  end
  
  test "made_by_current_parent" do
    sign_in parents(:Parent_1)
    assert_includes Chore.made_by_parent(parents(:Parent_1)), chores(:Chore_1)
    refute_includes Chore.made_by_parent(parents(:Parent_1)), chores(:Chore_85)
    sign_out parents(:Parent_1)
    sign_in parents(:Parent_2)
    refute_includes Chore.made_by_parent(parents(:Parent_2)), chores(:Chore_1)
    assert_includes Chore.made_by_parent(parents(:Parent_2)), chores(:Chore_85)
    sign_out parents(:Parent_2)
  end
end
