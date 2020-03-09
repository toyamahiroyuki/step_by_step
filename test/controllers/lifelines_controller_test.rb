require 'test_helper'

class LifelinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lifelines_new_url
    assert_response :success
  end

  test "should get index" do
    get lifelines_index_url
    assert_response :success
  end

end
