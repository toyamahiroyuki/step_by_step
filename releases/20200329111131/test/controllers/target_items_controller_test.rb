require 'test_helper'

class TargetItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get target_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get target_items_edit_url
    assert_response :success
  end

end
