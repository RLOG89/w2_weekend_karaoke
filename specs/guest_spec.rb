require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guest'

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Rocky Road", 100)
  end

  def test_guest_has_name
    assert_equal("Rocky Road", @guest.name)
  end

  def test_guest_has_money
    assert_equal(100, @guest.money)
  end

end