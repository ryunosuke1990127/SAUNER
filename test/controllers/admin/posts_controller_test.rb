require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_posts_show_url
    assert_response :success
  end

  test "should get create" do
    get admin_posts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_posts_destroy_url
    assert_response :success
  end

  test "should get complete" do
    get admin_posts_complete_url
    assert_response :success
  end

  test "should get deny" do
    get admin_posts_deny_url
    assert_response :success
  end
end
