require 'test_helper'

class ApprovalControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in parents(:Parent_1)
  end
  
  test "should get index" do
    get approval_index_url
    assert_response :success
  end
end
