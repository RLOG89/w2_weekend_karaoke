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

    @guest_1 = Guest.new("Big Tony")
    @guest_2 = Guest.new("Janice fae the Broch")
    @guest_3 = Guest.new("Martin")

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
    @room_2.check_in_guest(@guest_1)
    guest = @room_2.is_guest_in_room?(@guest_1)
    assert_equal(guest, true)
    assert_equal("Big Tony", @room_2.guests[0].name)
  end

  def test_check_out_guest
    @room_3.check_in_guest(@guest_2)
    @room_3.check_out_guest(@guest_2)
    assert_equal(false, @room_3.is_guest_in_room?(@guest_2))
  end

  def test_big_room_has_capacity_of_20
    assert_equal(20, @room_4.capacity)
  end

  def test_cant_go_over_capacity
    room = Karaoke.new("Small Room", 2)
    [@guest_1, @guest_2, @guest_3].each do |guest|
      room.check_in_guest(guest)
    end
    assert_equal(2, room.guests.count)
  end

end