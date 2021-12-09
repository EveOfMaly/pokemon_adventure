require_relative '../config/environment'

class Player 
    attr_accessor :player_id, :user_name, :first_name, :last_name, :trainer_level, :pokeballs, :pokemon, :items

    @@all = []
    
    def initialize
        @player_id = nil
        @user_name = nil 
        @trainer_level = 0 
        self.class.all << self 
    end

    def self.all
        @@all 
    end

    def self.find_or_create_player(user_name)
        if Player.all.count == 0 
            puts "User doesn't exit"
            puts "Creating the username for you:"
            new_player = Player.new
            new_player.user_name = user_name
        elsif Player.all.count > 0 
            Player.all.each do |ele|
                if ele.user_name == user_name 
                    puts "player exist"
                    puts "open that player"
                else 
                    puts "User doesn't exit"
                    puts "Creating the username for you:"
                    new_player = Player.new
                    new_player.user_name = user_name
                end
            end
        end
    end
end 




