require 'test_helper'

class TargetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get targets_new_url
    assert_response :success
  end

  test "should get index" do
    get targets_index_url
    assert_response :success
  end

  test "should get edit" do
    get targets_edit_url
    assert_response :success
  end

end
