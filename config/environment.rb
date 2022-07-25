#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require 'require_all'
require "project_pokemon"
require "pry"
require 'json'
require 'awesome_print'
require "irb"
require 'open-uri'
require 'net/http'
require 'poke-api-v2'
require 'httparty'
require 'sqlite3'
require 'bundler' #makes it so Ruby can find all the Ruby gems in the Gemfile.
Bundler.require
require_all 'lib'


# You can add fixtures and/or initialization code here to make experimenting
# with your gem easier. You can also use a different console, if you like.

# (If you use this, don't forget to add pry to your Gemfile!)
# Pry.start

require "irb"

#database connection
DB = {:conn => SQLite3::Database.new("./db/pokemon_adventure.db")} #why is this the path???
# IRB.start(__FILE__)


