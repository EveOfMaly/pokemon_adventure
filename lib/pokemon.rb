# require_relative '../config/environment'
# require_relative '../lib/pokemon'
# require_relative '../lib/player'
# require_relative '../lib/move'
# require_relative '../lib/account_creation'

class Pokemon
    #pokemon belong to a player
    attr_accessor :player, :name, :pokedex_number, :level, :base_experience, :description, :moves, :base_happiness, :capture_rate,  :nick_name, :species, :id

    @@pokedex = []  #responsible for keeping track of all pokemon in this world

    def initialize(pokemon_data)
        @name = pokemon_data["name"]
        @base_experience = pokemon_data["base_experience"] 
        @pokedex_number = pokemon_data["id"]
        @moves = []  #pokemon has many moves
        @id = nil #sql database id
        self.class.all << self  #every encounter with a pokemon we put in the pokedex.       
    end


    def self.all 
        @@pokedex 
    end

#using a heredoc to run a string that runs multiple lines. 
    def self.create_table 
        sql = <<-SQL
            CREATE TABLE IF NOT EXISTS pokemons (
                id INTEGER PRIMARY KEY,
                name TEXT,
                pokedex_number INTEGER,
                level INTEGER, 
                base_experience INTEGER, 
                description TEXT, 
                base_happiness INTEGER,
                capture_rate INTEGER,  
                nick_name TEXT, 
                species TEXT
            )
        SQL
        DB[:conn].execute(sql)
    end


    def save 
        sql = <<-SQL
            INSERT INTO pokemons (name, pokedex_number,level, base_experience, description, base_happiness,capture_rate,  nick_name, species) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        SQL

        DB[:conn].execute(sql, self.name, self.pokedex_number, self.level, self.base_experience, self.description, self.base_happiness, self.capture_rate,  self.nick_name, self.species) 
        @id = DB[:conn].execute("SELECT last_insert_rowid() from pokemons")[0][0]
    end 

    

end














