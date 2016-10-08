require 'minitest/autorun'
require 'minitest/rg'
require_relative '../room'

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("THE WORLD")
  end

  def test_room_has_a_name
    assert_equal("THE WORLD", @room.name)
  end

end