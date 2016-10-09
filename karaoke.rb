require_relative 'song'
require_relative 'guest'
require_relative 'room'
require_relative 'bar'

class Karaoke < Room

  attr_reader :song, :guests, :capacity, :cost

  def initialize(name, capacity = 5)
    super(name)
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
      puts "This room is full, #{guest.name} please choose another"
      return nil
    end
  end

  def is_guest_in_room?(guest)
    @guests.include?(guest)
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  # def guest_buys_a_drink
  #   drinks_count = 0
  #   @guest.money -= @drinks_list.fetch(key)
  #   @till_balance += @drinks_list.fetch(key)
  #   @guest.drinks_count += 1
  # end

end