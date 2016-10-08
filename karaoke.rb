require_relative 'song'
require_relative 'guest'
require_relative 'room'

class Karaoke < Room

  attr_reader :song, :guests, :capacity, :cost

  def initialize(name, capacity = 5)
    @name = name
    @song = nil
    @guests = []
    @capacity = capacity
    @cost = 10
  end

  def play_song(song)
    @song = song
  end

  def check_in_guest(guest)
    if @guests.count < @capacity && guest.money >= @cost 
      @guests.push(guest) 
      guest.money -= @cost
    else 
      puts "This room is full, please choose another"
      return nil
    end
  end

  def is_guest_in_room?(guest)
    @guests.include?(guest)
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end


 
end