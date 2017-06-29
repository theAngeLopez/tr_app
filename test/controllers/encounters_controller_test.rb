require 'test_helper'

class EncountersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get encounters_index_url
    assert_response :success
  end

  test "should get show" do
    get encounters_show_url
    assert_response :success
  end

  test "should get edit" do
    get encounters_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get encounters_destroy_url
    assert_response :success
  end

end
