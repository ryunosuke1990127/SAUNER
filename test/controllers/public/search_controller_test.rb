require "test_helper"

class Public::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_search_new_url
    assert_response :success
  end
end
