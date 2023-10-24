require "test_helper"

class Public::MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_mypage_show_url
    assert_response :success
  end
end
