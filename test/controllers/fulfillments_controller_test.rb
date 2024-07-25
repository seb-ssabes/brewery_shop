require "test_helper"

class FulfillmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get fulfillments_show_url
    assert_response :success
  end
end
