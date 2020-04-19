require 'test_helper'

class IncomesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get incomes_new_url
    assert_response :success
  end
end
