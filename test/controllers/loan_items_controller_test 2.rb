require 'test_helper'

class LoanItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get loan_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get loan_items_edit_url
    assert_response :success
  end
end
