require 'test_helper'

class ProportialCostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get proportial_costs_new_url
    assert_response :success
  end

end
