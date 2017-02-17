require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
  setup do
    @chore = chores(:one)
  end
  
  test "overdue" do
    assert_includes Chore.overdue, chores(:two)
    refute_includes Chore.overdue, chores(:one)
  end
  
  test "due_this_week" do
    assert_includes Chore.due_this_week, chores(:one)
    refute_includes Chore.due_this_week, chores(:two)
  end
  
  test "made_by_current_parent" do
    sign_in parents(:one)
    assert_includes Chore.made_by_parent(parents(:one)), chores(:one)
    assert_includes Chore.made_by_parent(parents(:one)), chores(:two)
    refute_includes Chore.made_by_parent(parents(:one)), chores(:three)
    sign_out parents(:one)
    sign_in parents(:two)
    refute_includes Chore.made_by_parent(parents(:two)), chores(:one)
    refute_includes Chore.made_by_parent(parents(:two)), chores(:two)
    assert_includes Chore.made_by_parent(parents(:two)), chores(:three)
  end
end
