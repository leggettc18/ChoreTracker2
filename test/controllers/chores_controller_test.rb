require 'test_helper'

class ChoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chore = chores(:one)
  end

  test "should get index" do
    get chores_url
    assert_response :success
  end

  test "should get new" do
    get new_chore_url
    assert_response :success
  end

  test "should create chore" do
    assert_difference('Chore.count') do
      post chores_url, params: { chore: {  } }
    end

    assert_redirected_to chore_url(Chore.last)
  end

  test "should show chore" do
    get chore_url(@chore)
    assert_response :success
  end

  test "should get edit" do
    get edit_chore_url(@chore)
    assert_response :success
  end

  test "should update chore" do
    patch chore_url(@chore), params: { chore: {  } }
    assert_redirected_to chore_url(@chore)
  end

  test "should destroy chore" do
    assert_difference('Chore.count', -1) do
      delete chore_url(@chore)
    end

    assert_redirected_to chores_url
  end
end
