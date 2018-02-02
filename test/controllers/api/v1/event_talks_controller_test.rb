require 'test_helper'

class Api::V1::EventTalksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_event_talks_index_url
    assert_response :success
  end

end
