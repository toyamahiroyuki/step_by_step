require 'test_helper'

class CommunicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get communications_new_url
    assert_response :success
  end

  test "should get show" do
    get communications_show_url
    assert_response :success
  end

  test "should get edit" do
    get communications_edit_url
    assert_response :success
  end
end
