require 'date'
require 'colorize'
require './app'
require './books/book_handling'
require './games/game_handling'
require './movies/movie_handling'
require './music/music_album_handling'
require './console_helper'

@app = App.new

def menu
  clear_terminal
  print 'Welcome to your catalog of things! Please choose one of the following actions:
    1 ) List all books
    2 ) List all labels
    3 ) Add a book
    4 ) List all games
    5 ) List all authors
    6 ) Add a game
    7 ) List all music albums
    8 ) List all genres
    9 ) Add a music album
    10) List all movies
    11) List all sources
    12) Add a movie
    13) Quit
    Your choice: '
end

def process_input
  actions = %w[list_all_books list_all_labels add_book list_all_games list_all_authors
               add_game list_all_music_albums list_all_genres add_music_album
               list_all_movies list_all_sources add_movie quit_app]
  option = gets.chomp.to_i - 1

  if actions[option]
    @app.add_book(*add_book) if actions[option] == 'add_book'
    @app.add_game(*add_game) if actions[option] == 'add_game'
    @app.add_music_album(*add_music_album) if actions[option] == 'add_music_album'
    @app.add_movie(*add_movie) if actions[option] == 'add_movie'
    @app.public_send(actions[option]) unless %w[add_book add_game add_music_album
                                                add_movie].include?(actions[option])
    pause
    return
  end

  puts 'I don\'t know how to handle your choice. Try choosing again!'.red
  pause
end

def add_book
  clear_terminal
  publisher = add_book_publisher
  cover_state = add_book_cover_state
  publish_date = add_book_publish_date
  puts 'Terrific! Let\'s associate a label to this book!'
  title = add_label_title
  color = add_label_color

  [publisher, cover_state, publish_date, title, color]
end

def add_game
  clear_terminal
  multiplayer = add_game_multiplayer
  last_played_at = add_game_last_played_at
  publish_date = add_game_publish_date
  puts 'Terrific! Let\'s associate an author to this game!'
  first_name = add_author_first_name
  last_name = add_author_last_name

  [multiplayer, last_played_at, publish_date, first_name, last_name]
end

def add_music_album
  clear_terminal
  on_spotify = add_music_album_on_spotify
  publish_date = add_music_album_publish_date
  puts 'Terrific! Let\'s associate a genre to this music album!'
  name = add_genre_name

  [on_spotify, publish_date, name]
end

def add_movie
  clear_terminal
  silent = add_movie_silent
  publish_date = add_music_album_publish_date
  puts 'Terrific! Let\'s associate a source to this movie!'
  name = add_source_name

  [silent, publish_date, name]
end

def main(status)
  loop do
    break unless status

    menu
    process_input
  end
end

main(true)
