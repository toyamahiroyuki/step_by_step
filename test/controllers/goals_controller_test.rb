require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get goals_new_url
    assert_response :success
  end

  test "should get index" do
    get goals_index_url
    assert_response :success
  end

  test "should get edit" do
    get goals_edit_url
    assert_response :success
  end

end
