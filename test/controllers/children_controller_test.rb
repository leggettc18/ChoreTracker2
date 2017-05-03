require 'test_helper'

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in parents(:Parent_1)
    @child = children(:Child_1)
  end

  test "should get index" do
    get children_url
    assert_response :success
  end

  test "should get new" do
    get new_child_url
    assert_response :success
  end

  test "should create child" do
    assert_difference('Child.count') do
      post children_url, params: { child: { :name => "test" } }
    end

    assert_redirected_to children_url
  end

  test "should show child" do
    get child_url(@child)
    assert_response :success
  end

  test "should get edit" do
    get edit_child_url(@child)
    assert_response :success
  end

  test "should update child" do
    patch child_url(@child), params: { child: {  } }
    assert_redirected_to children_url
  end

  test "should destroy child" do
    assert_difference('Child.count', -1) do
      delete child_url(@child)
    end

    assert_redirected_to children_url
  end
end
