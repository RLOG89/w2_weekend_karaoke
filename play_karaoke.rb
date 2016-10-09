require_relative 'karaoke'

rooms = [
  Room.new("For the Pros"),
  Room.new("For the noobs"),
  Room.new("For the farmers")
]


puts "Hi!  What's your name?"
name = $stdin.gets.chomp
puts "Cool.  How much can afford for karaoke?"
money = $stdin.gets.chomp
guest = Guest.new(name, money)
puts "Welcome #{guest.name}."
puts "What would you like to do?  Go to a room or hit the bar?"
what_to_do = $stdin.gets.chomp
if what_to_do.downcase.include?("bar") 
  #make special offer dynamic
  puts "Cool, you can afford around #{guest.money.to_i/5} drinks, and we currently have an offer on Staropramen, would you like one?"
  drink = $stdin.gets.chomp
  # if drink.include?("yes") 
  #   exit
  elsif what_to_do.downcase.include?("room")
    puts "Great, which room would you like to go to?  Tonight we have #{rooms.count} rooms, #{rooms.map {|room| room.name}.join(', ')}.  What are you in the mood for?"
  else puts "Sorry you're too drunk, not tonight."
    exit
  # end
end