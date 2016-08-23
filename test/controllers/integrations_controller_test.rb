require 'test_helper'

class IntegrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get integrations_index_url
    assert_response :success
  end

  test "should get show" do
    get integrations_show_url
    assert_response :success
  end

  test "should get new" do
    get integrations_new_url
    assert_response :success
  end

end
