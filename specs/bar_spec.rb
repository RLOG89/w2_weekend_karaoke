require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bar'

class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new("The Bar")
  end

  def test_bar_has_name
    assert_equal("The Bar", @bar.name)
  end
end