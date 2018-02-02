require 'test_helper'

class Api::V1::TalkUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_talk_users_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_talk_users_create_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_talk_users_destroy_url
    assert_response :success
  end

end
