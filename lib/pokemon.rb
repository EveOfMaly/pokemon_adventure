require_relative '../config/environment'

class Pokemon

    attr_accessor :name, :level, :base_experience, :abilities, :description, :moves, :base_happiness, :capture_rate, :pokedex_number 


    @@all = []

    def initialize
        @level = 0 #all pokemon start with level 0???randomize later
        self.class.all << self 
    end

    def self.all 
        @@all 
    end


   @@pm_array = []
   @@desc_array = []
   @@move_array = []

   #question: how do i get the data sof if we search a large set it doesn't take forever....?

    def self.get_pokemon
        for i in 1..3
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

            # pokemon_data = open("https://pokeapi.co/api/v2/pokemon/#{i}").read
            # json_data = JSON.parse(pokemon_data)
            # @@pm_array.push(json_data)

            # #get description data of the pokemon: 
            # #description data of interest: base_happiness, capture_rate, flavour text 
            # descr_data = open("https://pokeapi.co/api/v2/pokemon-species/#{i}").read
            # desc_json_data = JSON.parse(descr_data)
            # @@desc_array.push(desc_json_data)
       
        end
    end

    def self.create_pokemon
        Pokemon.get_pokemon

        for pokemon in @@pm_array
            new_pokemon = Pokemon.new
            new_pokemon.name = pokemon["name"]
            new_pokemon.base_experience = pokemon["base_experience"]
            new_pokemon.abilities = pokemon["abilities"]
            new_pokemon.description = @@desc_array[pokemon["id"]-1]["flavor_text_entries"][0]["flavor_text"]
            new_pokemon.base_happiness = @@desc_array[pokemon["id"]-1]["base_happiness"]
            new_pokemon.capture_rate = @@desc_array[pokemon["id"]-1]["capture_rate"]
            new_pokemon.pokedex_number  = @@desc_array[pokemon["id"]-1]["pokedex_numbers"][0]["entry_number"]

            # new_pokemon.moves = pokemon["moves"] #array of moves >-- clean this up

            #give access to the moves based on the level
            #implement choose a move later??
            pokemon["moves"].each do |moves|
                if new_pokemon.level == moves["version_group_details"][0]["level_learned_at"]
                    new_pokemon.moves = pokemon["moves"]
                end
            end
            # end 
        end

    end

end








