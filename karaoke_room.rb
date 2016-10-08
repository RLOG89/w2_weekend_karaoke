require_relative 'song'
require_relative 'guest'

class KaraokeRoom

  attr_accessor :name, :song, :guests

  def initialize(name)
    @name = name
    @song = nil
    @guests = []
  end

  def play_song(song)
    @song = song
  end

  # def check_in_guest(guest, room)
  #   @guest << @room
  # end

  # def add_song_to_room

  # end

  # def create_room

  # end


 


end