require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get loans_new_url
    assert_response :success
  end

  test "should get index" do
    get loans_index_url
    assert_response :success
  end

  test "should get edit" do
    get loans_edit_url
    assert_response :success
  end

end
