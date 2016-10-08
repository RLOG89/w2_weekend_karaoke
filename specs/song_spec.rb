require 'minitest/autorun'
require 'minitest/rg'
require_relative '../song'

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("John Lennon", "Imagine")
  end

  def test_get_song_title
    assert_equal("Imagine", @song.title)
  end

  def test_get_song_artist
    assert_equal("John Lennon", @song.artist)
  end



end