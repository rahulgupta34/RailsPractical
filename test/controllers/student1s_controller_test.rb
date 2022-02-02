require "test_helper"

class Student1sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student1s_index_url
    assert_response :success
  end
end
