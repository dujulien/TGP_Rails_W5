require 'test_helper'

class CreateGossipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get create_gossip_index_url
    assert_response :success
  end

end
