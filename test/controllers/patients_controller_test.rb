require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patients_index_url
    assert_response :success
  end

  test "should get show" do
    get patients_show_url
    assert_response :success
  end

  test "should get edit" do
    get patients_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get patients_destroy_url
    assert_response :success
  end

end
