require 'test_helper'

class MovingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get movings_new_url
    assert_response :success
  end

  test "should get index" do
    get movings_index_url
    assert_response :success
  end

  test "should get edit" do
    get movings_edit_url
    assert_response :success
  end
end
