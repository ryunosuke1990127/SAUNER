require "test_helper"

class Public::RegionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_regions_new_url
    assert_response :success
  end

  test "should get create" do
    get public_regions_create_url
    assert_response :success
  end
end
