require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'
require_relative '../lib/move'

class Pokemon
    #pokemon belong to a player
    attr_accessor :player, :name, :level, :base_experience, :abilities, :description, :moves, :base_happiness, :capture_rate, :pokedex_number, :nick_name

    @@pokedex = []  #responsible for keeping track of all pokemon in this world

    def initialize
        @level = 0 #all pokemon start with level 0???randomize later 
        @moves = []  #pokemon has many moves
        self.class.all << self  #every encounter with a pokemon we put in the pokedex.
    end

    def self.all 
        @@pokedex 
    end


   @@pm_array = []
   @@desc_array = []
   @@move_array = []

   #question: how do i get the data sof if we search a large set it doesn't take forever....?

    def self.get_pokemon
        for i in 1..200
            # get data (including species, sprites, and base stats) about each of the first 151 pokemon
            uri = URI.parse("https://pokeapi.co/api/v2/pokemon/#{i}")
            response_pokemon = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
            response_pokemon.body 
            json_data = JSON.parse(response_pokemon.body)
            @@pm_array.push(json_data)

            # #get description data of the pokemon: 
            uri = URI.parse("https://pokeapi.co/api/v2/pokemon-species/#{i}")
            response_desc = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
            response_desc.body 
            json_data = JSON.parse(response_desc.body)
            @@desc_array.push(json_data)
   
        end
    end

    ##array of moves for pokemon all 

    ## go through list of pokemon and create an instance for each move
    ##associated each move with pokemon 

    #add_instances of moves for specific pokemon and associate moves
   
    def create_move
         @@new_pokemon_moves_collection 
         
         array_of_moves_data = []
         
         @@new_pokemon_moves_collection.each do |move|
            array_of_moves_data <<  move
        end

        @@new_move = []

        array_of_moves_data

        array_of_moves_data.each do |move_hash|
            move_name = move_hash["move"]["name"]
            move_level_learned = move_hash["version_group_details"][0]["level_learned_at"]
            new_move = Move.new
            new_move.name = move_name 
            new_move.move_level_learned 
            new_move.pokemon = self 
        end
    end

    def self.list_pokemon_moves(pokemon)
        #find pokemon name
        kkk = []
        answer = Move.all.select {|move| move.pokemon.name == pokemon}
        answer.each do |move|
            kkk << move.name
        end
        kkk
    end

    def self.create_pokemon
        Pokemon.get_pokemon
     
        for pokemon in @@pm_array
            new_pokemon = Pokemon.new
            new_pokemon.pokedex_number  = @@desc_array[pokemon["id"]-1]["pokedex_numbers"][0]["entry_number"]
            new_pokemon.name = pokemon["name"]
            new_pokemon.base_experience = pokemon["base_experience"]
            new_pokemon.description = @@desc_array[pokemon["id"]-1]["flavor_text_entries"][0]["flavor_text"]
            new_pokemon.base_happiness = @@desc_array[pokemon["id"]-1]["base_happiness"]
            new_pokemon.capture_rate = @@desc_array[pokemon["id"]-1]["capture_rate"]

            @@new_pokemon_moves_collection = pokemon["moves"] 
            new_pokemon.create_move
            new_pokemon.moves = @@new_move
            


            # self.add_move(array_of_moves_data)

            # # def add_move(array_of_moves_data)
            # #     @moves << pokemon
            # #     pokemon.player = self 
            # end



            # new_move = Move.new
            # new_pokemon.pokedex_number  = @@desc_array[pokemon["id"]-1]["pokedex_numbers"][0]["entry_number"]
            # new_pokemon.name = pokemon["name"]
            # new_pokemon.base_experience = pokemon["base_experience"]
            # new_pokemon.description = @@desc_array[pokemon["id"]-1]["flavor_text_entries"][0]["flavor_text"]
            # new_pokemon.base_happiness = @@desc_array[pokemon["id"]-1]["base_happiness"]
            # new_pokemon.capture_rate = @@desc_array[pokemon["id"]-1]["capture_rate"]

          
     
            # #give access to the moves based on the level
            # #implement choose a move later??
            # pokemon["moves"].each do |moves|
            #     if new_pokemon.level == moves["version_group_details"][0]["level_learned_at"]
            #         new_pokemon.moves = pokemon["moves"]
            #     end
            # end
   
        end
    end


    

end

Pokemon.create_pokemon












