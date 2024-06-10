require "test_helper"

class MerchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get merch_index_url
    assert_response :success
  end
end
