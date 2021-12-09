#!/usr/bin/env ruby

require_relative '../config/environment'


#Welcome user to the game 
puts "Welcome to Pokemonlite CLI"
puts "Do you have an account 'Y' or 'N'"

#get input from user 
input = gets.chomp

##account creation 
if input == "Y" 
  puts "Please enter your user_name?"
  user_name_input = gets.chomp
  player = Player.find_or_create_player(user_name_input)
elsif input == "N"
  player = Player.new
  puts "lets create the account for you"
  puts "Please enter your first name"
  player_first_name = gets.chomp
  player.first_name = player_first_name
  puts "Please enter your last name"
  player_last_name = gets.chomp
  player.last_name = player_first_name
  puts "Please enter your user name"
  player_user_name = gets.chomp
  player.user_name = player_user_name
end

Game.new(player)
new_game.displaymenu
@input = gets.chomp
new_game.valid?

binding.pry

until game.exit?
  game.play
end


# Game.new(player)

# until game.exit?
#    game.play
# end





  # if Player.all.include?(user_name_input)

  # end
#   new_player.first_name = new_player_first_name
#   puts get their first_name and last_name
#   new_player_last_name = gets.chomp
#   new_player.last_name = new_player_last_name
# # #if they have played the game load get the user name and password:
# # #load saved game
# elsif input = "N"
#   # #if they have not played the game create account
#   new_player = Player.new
#   puts "lets create the account for you"
#   new_player_first_name = gets.chomp
#   new_player.first_name = new_player_first_name
#   puts get their first_name and last_name
#   new_player_last_name = gets.chomp
#   new_player.last_name = new_player_last_name
# end



# Pokemon.create_pokemon




# #display the main menu until they quit 


# until game.won?
#   game.play
# end

# # play_again = ""
# # puts "Enter N or no to exit the game and y or yes to play"
# # until play_again.downcase == "n" || play_again.downcase == "no"
# #   puts "Would you like to play again?"
# #   play_again = gets.strip
# #   play_again.downcase == "y" || play_again.downcase == "yes"
# #   game = Game.new
# #   until game.won?
# #     game.play
# #   end
# # end


# ProjectPokemon::CLI.new.call 