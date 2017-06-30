require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @james = patients(:one)
    @sandy = patients(:two)
  end

  test "should get root" do
    get root_path
    assert_response :success
  end
  #
  test "should get show" do
    get patients_path
    assert_response :success
  end

  test "should create new patient" do
    get new_patient_path
    assert_response :success

    post patients_path,
      params: { patient: {
        id: 3,
        mrn: "THC126",
        first_name: "Harry",
        middle_name: "Benson",
        last_name: "Banner",
        weight: 825,
        height: 120
        }
      }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal "Patient has been added", flash[:notice]
  end

  test "should update patient" do
    get edit_patient_path(@james)
    assert_response :success

    patch patient_path(@james), params: { patient: { first_name: "Jameson"} }

    assert_redirected_to patient_path(@james)
    @james.reload
    assert_equal "Jameson", @james.first_name
  end

  test "should delete patient" do
    assert_difference('Patient.count', -1) do
      delete "/patients/#{@james.id}"
    end
    assert_redirected_to root_path
    assert_equal "Patient and their encounters have been deleted", flash[:notice]
  end
end
