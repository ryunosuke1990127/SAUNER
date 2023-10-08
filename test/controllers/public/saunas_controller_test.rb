require "test_helper"

class Public::SaunasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_saunas_index_url
    assert_response :success
  end

  test "should get show" do
    get public_saunas_show_url
    assert_response :success
  end

  test "should get new" do
    get public_saunas_new_url
    assert_response :success
  end

  test "should get create" do
    get public_saunas_create_url
    assert_response :success
  end

  test "should get complete" do
    get public_saunas_complete_url
    assert_response :success
  end
end
