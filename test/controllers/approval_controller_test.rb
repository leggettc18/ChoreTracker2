require 'test_helper'

class ApprovalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get approval_index_url
    assert_response :success
  end

end
