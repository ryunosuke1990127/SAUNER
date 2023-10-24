require "test_helper"

class Public::MemberControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_member_show_url
    assert_response :success
  end
end
