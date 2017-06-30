require 'test_helper'

class EncountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @james = patients(:one)
    @sandy = patients(:two)
    @one = encounters(:one)
    @two = encounters(:two)
    @three = encounters(:three)
    @four = encounters(:four)
  end

  test "should create new encounter" do
    get new_patient_encounter_path(@sandy)
    assert_response :success

    post patient_encounters_path(@sandy),
    params: { encounter: {
      visit_number: "VN0005",
      admitted_at: "1994-01-08 10:05:30",
      discharged_at: "1994-01-18 04:24:30",
      location: "Third Ward",
      room: 382,
      bed: 1,
      patient_id: @sandy.id
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal "Encounter has been added", flash[:notice]
  end

  test "should update encounter" do
    get edit_patient_encounter_path(@james, @one)
    assert_response :success

    patch patient_encounter_path(@james, @one), params: { encounter: { location: "Mass Gen"} }

    assert_redirected_to patient_encounter_path(@one)
    @one.reload
    assert_equal "Mass Gen", @one.location
  end

  test "should delete encounter" do
    assert_difference('Encounter.count', -1) do
      delete patient_encounter_path(@james, @one)
    end
    assert_redirected_to patient_path(@james)
    assert_equal "Encounter has been deleted", flash[:notice]
  end
end
