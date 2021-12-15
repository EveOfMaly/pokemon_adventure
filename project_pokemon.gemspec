# frozen_string_literal: true

require_relative "lib/project_pokemon/version"

Gem::Specification.new do |spec|
  spec.name = "project_pokemon"
  spec.version = ProjectPokemon::VERSION
  spec.authors = ["EveOfMaly"]
  spec.email = ["john.a.kyeremeh@gmail.com"]

  spec.summary = "Project Pokemon is a simple command line pokemon game."
  spec.description = "Project pokemon aims to take through the pokemon adventures. 
                      User receives instructions to 1) Catch Pokemon 2) See Their Pokemon List 3) Display Bag 4) See Money 5) Shop 6) Log Out 7. Start Battle (Future versions)."
  spec.homepage = "https://github.com/EveOfMaly/pokemon_adventure.git"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/EveOfMaly/pokemon_adventure.git"
  spec.metadata["changelog_uri"] = "https://github.com/EveOfMaly/pokemon_adventure/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
