require 'test_helper'

class EncounterTest < ActiveSupport::TestCase
  setup do
    @one = encounters(:one)
    @two = encounters(:two)
  end

  test "valid encounter" do
    assert @one.valid?
  end

  test "encounter must have required data" do
    @one.visit_number = nil
    @one.admitted_at = nil

    refute @one.valid?, 'encounter saved without required data'
    assert_not_nil @one.errors
  end
end
