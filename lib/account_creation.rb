require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'
require_relative '../lib/move'
require_relative '../lib/game'


class Accounts

    @@player = nil #set class player to empty upon account creation. 

    @@accounts = []  #keep track of all accounts 


    def self.add_account(player)
        @@accounts << player 
    end

    def self.all
        @@accounts.uniq #keeps tracks of all uniq accounts made
    end

    def self.player_data
        @@player #keeps track of instance of player data
    end
    
    def self.user
        @@input = gets.chomp
        
      if @@input == "Y"
        puts "Great. Let's look for your account data.".colorize(:green)
        puts "Please enter the user name for your account.".colorize(:blue)
        user_name_input = gets.chomp
        player = Player.find_or_create_player(user_name_input) #find or create the player
        add_account(player)
        @@player  = player 
      elsif @@input == "N"
        puts "Okay, no problem.".colorize(:green)
        puts "Answer a few questions to create your account".colorize(:green)
        player = Player.new
        game = Game.new(player)
        player.game = game 
        puts "Please enter your first name.".colorize(:blue)
        player_first_name = gets.chomp
        player.first_name = player_first_name
        puts "Please enter your last name.".colorize(:blue)
        player_last_name = gets.chomp
        player.last_name = player_first_name
        puts "Please enter your user name.".colorize(:blue)
        player_user_name = gets.chomp
        player.user_name = player_user_name
        add_account(player)
        @@player  = player 
      else
        puts "That is not a valid input..Do you have an account 'Y' or 'N'".colorize(:red)
        user
      end
    end

    #return is the game instance 

    def self.open_or_create_account(player)
        player.game
    end

end