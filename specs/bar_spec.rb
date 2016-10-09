require 'minitest/autorun'
require 'minitest/rg'
require 'pry'
require_relative '../bar'

class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new("The Bar", 1000)

    @drinks_list = {
      "JD & Coke" => 5,
      "Gin & Tonic" => 5,
      "House Wine" => 5,
      "Champagne" => 10
    }

    @special_offers = { 
      "Staropramen" => 4
    }
  end

  def test_bar_has_name
    assert_equal("The Bar", @bar.name)
  end

  def test_bar_has_a_float
    assert_equal(1000, @bar.till_balance)
  end

  def test_float_increases_when_drink_sold
    new_till_balance = 1000
    drinks_bought = (@drinks_list).fetch("JD & Coke")
    new_till_balance += drinks_bought
    assert_equal(1005, new_till_balance)
  end

  # def test_float_increases_when_drink_sold_again
  #   assert_equal(1000, @till_balance)
  #   assert_equal(100, @tony.money)
  #   @bar.buy_drinks("JD & Coke")
  #   assert_equal(1005, @till_balance)
  #   assert_equal(5, @tony.money)
  # end


end