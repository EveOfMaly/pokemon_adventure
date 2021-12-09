class Game

    attr_accessor :player, :pokeballs

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

    def exit?
        @input == 8
        puts "thanks for playing the game"
    end


    def play 
        player = @player   
        binding.pry
        # if !@board.valid_move?(current_move)
        #     turn
        # else
        #     puts "Turn: #{@board.turn_count+1}\n"
        #     @board.display
        #     @board.update(current_move, player) #updates the board with the current move 
        #     puts "#{player.token} moved #{current_move}"
        #     @board.display
        #     puts "\n\n"
        # end
    end


   

    # def play
    #     while !exit?
    #         turn
    #     end

    #     # if won?
    #     #     puts "Congratulations #{winner}!"
    #     # elsif draw?
    #     #     puts "Cat's Game!"
    #     # end

    # end

    def catch_pokemon
        puts "catch pokemon"
    end


    def my_pokemon
        puts "see list of your pokemon"
    end



    def my_bag
        puts "see your bag"
    end


    def my_money
        puts "see money"
    end


    def log_out
        puts "logging out"
    end


        
end 
