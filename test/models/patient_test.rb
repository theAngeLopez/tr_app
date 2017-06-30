require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  setup do
    @james = patients(:one)
  end

  test "valid patient" do
    assert @james.valid?
  end

  test "patient must have required data" do
    @james.first_name = nil
    @james.middle_name = nil
    @james.mrn = nil

    refute @james.valid?, 'patient saved without required data'
    assert_not_nil @james.errors
  end
end
