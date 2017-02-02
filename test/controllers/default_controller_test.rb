require 'test_helper'

class DefaultControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get default_index_url
    assert_response :success
  end

end
