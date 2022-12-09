require_relative './games/game'
require_relative './games/author'
require_relative './games/game_module'
require 'json/add/struct'
require 'json'

GameStruct = Struct.new(:game)

class App
  def initialize
    @games = []
  end

  include GameModule

  def games
    puts "
        1. Add game
        2. List games
        3. List all authors
        4. Back
        "
    choice = gets.chomp
    case choice
    when '1'
      add_game
    when '2'
      list_of_games
    when '3'
      list_of_authors
    when '4'
      reload
    else
      puts 'Invalid choice'
      Game
    end
  end
end
