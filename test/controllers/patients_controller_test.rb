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

  test "should see home page" do
    get root_path
    assert_select "h1", "All Patients"
  end

  test "should see table with patient information" do
    get root_path
    assert_select "tr" do
      assert_select "th:nth-child(1)", "MRN"
      assert_select "th:nth-child(2)", "First Name"
      assert_select "th:nth-child(3)", "Last Name"
      assert_select "th:nth-child(4)", "Actions"
    end
  end

  test "patient Actions column should have 3 actions" do
    get root_path
    assert_select "table:last-child" do
      assert_select "tr:last-child" do
        assert_select 'a:nth-child(1)', "Show"
        assert_select 'a:nth-child(2)', "Edit"
        assert_select 'a:nth-child(3)', "Delete"
      end
    end
  end

  test "home page should have 'Add Patient' button" do
    get root_path
    assert_select "a", "Add Patient"
  end

  test "should see Submit and Cancel button in New Patient Page" do
    get new_patient_path

    assert_select 'input', value: "Save new Patient"
    assert_select 'input', value: "Cancel"
  end
end
