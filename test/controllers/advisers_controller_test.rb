require "test_helper"

class AdvisersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get advisers_show_url
    assert_response :success
  end
end
