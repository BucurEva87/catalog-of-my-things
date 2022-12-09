require_relative './game'
require_relative './author'

module GameModule
  def add_game
    puts 'Enter game name'
    multiplayer = gets.chomp.to_s
    puts "Enter Author's first name"
    first_name = gets.chomp.capitalize
    puts "Enter Author's last name"
    last_name = gets.chomp.capitalize
    puts 'Enter last played year(YYYY)'
    last_played_at = gets.chomp.to_i
    puts 'Game publish year(YYYY)'
    publish_date = gets.chomp.to_i
    game = Game.new(multiplayer, last_played_at, publish_date)
    author = Author.new(first_name, last_name)
    puts "player #{game.multiplayer} added"
    json = JSON.generate(GameStruct.new({ author: author.first_name, authors: author.last_name, name: multiplayer,
                                          last_played: last_played_at, published: publish_date }))
    @games << json
    File.write('./games/game.json', @games)
  end

  def list_of_games
    @games = JSON.parse(File.read('./games/game.json')) if File.exist?('./games/game.json') && File.read('./games/game.json') != ''
    if @games.empty?
      puts ''
    else
      puts "Total games:#{@games.count}"
      @games.each_with_index do |game, index|
        game = JSON.parse(game, create_additions: true)
        puts " #{index + 1}). The Game:#{game.game['name']}, is written by: #{game.game['author']} #{game.game['authors']}, last played at: #{game.game['last_played']}, and was published in: #{game.game['published']}"
      end
    end
    pause(3)
  end

  def list_of_authors
    @games = JSON.parse(File.read('./games/game.json')) if File.exist?('./games/game.json') && File.read('./games/game.json') != ''
    if @games.empty?
      puts ''
    else
      puts "Total authors:#{@games.count}"
      @games.each_with_index do |game, index|
        game = JSON.parse(game, create_additions: true)
        puts " #{index + 1}). #{game.game['author']} #{game.game['authors']} published #{game.game['name']}"
      end
    end
    pause(5)
  end

  def reload
  end
end

def pause(time = 2)
  sleep time
end
