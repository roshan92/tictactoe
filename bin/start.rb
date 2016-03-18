#!/usr/bin/env ruby

require_relative '../lib/tool'
require_relative '../lib/participant'
require_relative '../lib/computer'
require_relative '../lib/unbeatable'
require_relative '../lib/main'

if __FILE__ == $PROGRAM_NAME
  puts "Enter your desired name: "
  name = gets.chomp
  player_1 = Participant.new(name)
  puts "Choose your option :- /n 1. Against human, 2. Newbie computer, or 3. The Master "
  choice = gets.chomp.to_i
  until choice >= 1 && choice <= 3
    puts "Please enter either number 1, 2, or 3"
    choice = gets.chomp.to_i
  end
  case choice
  when 1
    puts "Enter second player's name"
    name = gets.chomp
    player_2 = Participant.new(name)
  when 2
    puts "You will now play against a newbie computer"
    player_2 = Computer.new("newbie")
  when 3
    puts "Good luck against the Master, there is no way to win !"
    player_2 = Unbeatable.new("The Master")
  end
  game = Main.new(player_1,player_2)
  game.start
end
