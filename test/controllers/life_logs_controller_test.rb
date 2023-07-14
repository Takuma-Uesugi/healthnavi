require "test_helper"

class LifeLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get life_logs_new_url
    assert_response :success
  end
end
