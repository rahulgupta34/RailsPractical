require "test_helper"

class CurdControllerTest < ActionDispatch::IntegrationTest
  test "should get curd_index" do
    get curd_curd_index_url
    assert_response :success
  end
end
