require 'minitest/autorun'
require 'minitest/rg'
require 'pry'
require_relative '../karaoke_room'
require_relative '../guest'
require_relative '../song'

class TestKaraokeRoom < MiniTest::Test

  def setup
  
    @room_1 = KaraokeRoom.new("Sizzling 70s")
    @room_2 = KaraokeRoom.new("Eclectic 80s")
    @room_3 = KaraokeRoom.new("Naughty 90s")

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


end