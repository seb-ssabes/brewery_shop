require "test_helper"

class BeersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beers_index_url
    assert_response :success
  end
end
