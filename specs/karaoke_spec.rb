require 'minitest/autorun'
require 'minitest/rg'
require 'pry'
require_relative '../karaoke'
require_relative '../guest'
require_relative '../song'

class TestKaraoke < MiniTest::Test

  def setup
  
    @room_1 = Karaoke.new("Sizzling 70s")
    @room_2 = Karaoke.new("Eclectic 80s")
    @room_3 = Karaoke.new("Naughty 90s")
    @room_4 = Karaoke.new("Big Room", 20)

    @tony = Guest.new("Big Tony", 100)
    @janice = Guest.new("Janice fae the Broch", 5)
    @martin = Guest.new("Martin")

    @song_1 = Song.new("John Lennon", "Imagine")
    @song_2 = Song.new("Led Zepplin", "Stairway to Heaven")
    @song_3 = Song.new("The Eagles", "Hotel California")

  end

  def test_room_has_a_name
    assert_equal("Sizzling 70s", @room_1.name)
  end

  def test_play_song
    @room_1.play_song(@song_1) 
    assert_equal("Imagine", @room_1.song.title)
  end

  def test_check_in_guest
    @room_2.check_in_guest(@tony)
    guest = @room_2.is_guest_in_room?(@tony)
    assert_equal(guest, true)
    assert_equal("Big Tony", @room_2.guests[0].name)
  end

  def test_check_out_guest
    @room_3.check_in_guest(@janice)
    @room_3.check_out_guest(@janice)
    assert_equal(false, @room_3.is_guest_in_room?(@janice))
  end

  def test_big_room_has_capacity_of_20
    assert_equal(20, @room_4.capacity)
  end

  def test_have_sufficient_funds_to_enter
    room = Karaoke.new("Small Room", 1)
    count = 0
    [@tony, @janice, @martin].select{|p| p.money >= room.cost}.each do |guest|
      count += 1
      room.check_in_guest(guest)
    end
    assert_equal(count, room.guests.count)
  end

  def test_guest_has_enough_money_for_entry
    assert_equal(100, @tony.money)
    assert_equal(10, @room_1.cost)
    @room_1.check_in_guest(@tony)
    assert_equal(90, @tony.money)
    assert_equal(true, @room_1.is_guest_in_room?(@tony))
  end

  def test_cant_go_over_capacity
    ross = Guest.new("Ross", 40)
    david = Guest.new("David", 10000)
    room = Karaoke.new("David & Ross Disco Room", 1)
    room.check_in_guest(ross)
    room.check_in_guest(david)
    assert_equal(1, room.guests.count)
  end

end