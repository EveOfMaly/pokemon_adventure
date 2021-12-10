require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'
require_relative '../lib/move'


class Game

    attr_accessor :player

    def initialize(player = Player.new)
        @player = player
        @pokeballs = 10
    end

    def displaymenu
        puts "Welcome to the main menu. Please select what you would like to do?"
        
        puts "1. Catch Pokemon"
        puts "2. My Pokemon"
        puts "3. My Bag"
        puts "4. My Money"
        puts "5. Shop"
        puts "6. Start Battle"
        puts "7. Exit"
        puts "8. Delete Account"
    end

    def valid?
        @input.between?(1,10)
    end


    def choose_game
        self.displaymenu
        @input = gets.chomp.to_i
        if !valid?
            self.choose_game
        elsif valid? && @input == 1
            #"1. Catch Pokemon"
            catch_pokemon
        elsif valid? && @input == 2
            #2. My Pokemon"
            @player.my_pokemon
        elsif valid? && @input == 3
            #3. My Bag"
            my_bag
        elsif valid? && @input == 4
            #4. My Money"
            my_money
        elsif valid? && @input == 5
            #5. Shop"
            shop
        elsif valid? && @input == 6
            #6. Start Battle"
            start_battle
        elsif valid? && @input == 7
            #7. Exit"
            exit?
        elsif valid?  && @input == 8
            #8. Delete Account"
            delete_account
        end
    end
   


    def catch_pokemon
        Pokemon.get_pokemon
        Pokemon.create_pokemon

        binding.pry
        puts "catch pokemon"
    end

    def my_pokemon
        puts "see list of your pokemon"
        @player.pokemon_slots 
    end

    def my_bag
        puts "see your bag"
    end


    def my_money
        puts "see money"
    end

    def exit?
        @input == "8"
        puts "thanks for playing the game"
    end

    def shop
        puts "shopping"
    end
    
    def start_battle
        puts "battling"
    end

    def delete_Account 
        puts "account deleted"
    end 
end 



