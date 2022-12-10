require 'json'
require_relative './books/book'
require_relative './books/label'
require_relative './games/game'
require_relative './games/author'
require_relative './music/genre'
require_relative './music/music_album'
require_relative './movies/movie'
require_relative './movies/source'
require_relative './console_helper'

class Loading
  def initialize(list)
    @books = list[:books]
    @labels = list[:labels]
    @games = list[:games]
    @authors = list[:authors]
    @music_albums = list[:music_albums]
    @genres = list[:genres]
    @movies = list[:movies]
    @sources = list[:sources]
  end

  def load_items
    return unless File.file?('items.json')

    f = File.new('items.json', 'r')
    f.readlines.each do |item|
      data = JSON.parse(item)
      case data['json_class']
      when 'Book'
        @books << Book.new(data['publisher'], data['cover_state'], data['publish_date'])
      when 'Game'
        @games << Game.new(data['multiplayer'], data['last_played_at'], data['publish_date'])
      when 'MusicAlbum'
        @music_albums << MusicAlbum.new(data['on_spotify'], data['publish_date'])
      when 'Movie'
        @movies << Movie.new(data['silent'], data['publish_date'])
      end
      create_associations(data)
    end
  end

  def create_associations(data, item)
    @labels << Label.new(data['label']['title'], data['label']['color'])
    @labels.last.add_item(item)
    @authors << Author.new(data['author']['first_name'], data['author']['last_name'])
    @authors.last.add_item(item)
    @genres << Genre.new(data['genre']['name'])
    @genres.last.add_item(item)
    @sources << Source.new(data['source']['name'])
    @sources.last.add_item(item)
  end

  def load_books
    return unless File.file?('books.json')

    f = File.new('books.json', 'r')
    f.readlines.each do |book|
      data = JSON.parse(book)
      @books << Book.new(data['publisher'], data['cover_state'], data['publish_date'])
      create_associations(data, @books.last)
    end
  end

  def load_games
    return unless File.file?('games.json')

    f = File.new('games.json', 'r')
    f.readlines.each do |game|
      data = JSON.parse(game)
      @games << Game.new(data['multiplayer'], data['last_played_at'], data['publish_date'])
      create_associations(data, @games.last)
    end
  end

  def load_music_albums
    return unless File.file?('music_albums.json')

    f = File.new('music_albums.json', 'r')
    f.readlines.each do |album|
      data = JSON.parse(album)
      @music_albums << MusicAlbum.new(data['on_spotify'], data['publish_date'])
      create_associations(data, @music_albums.last)
    end
  end

  def load_movies
    return unless File.file?('movies.json')

    f = File.new('movies.json', 'r')
    f.readlines.each do |movie|
      data = JSON.parse(movie)
      @movies << Movie.new(data['silent'], data['publish_date'])
      create_associations(data, @movies.last)
    end
  end

  def store_data
    puts 'Saving data to local files...'.blue
    pause
    f = File.new('books.json', 'w')
    @books.each { |book| f.puts(book.to_json) }
    f.close
    f = File.new('games.json', 'w')
    @games.each { |game| f.puts(game.to_json) }
    f.close
    f = File.new('music_albums.json', 'w')
    @music_albums.each { |album| f.puts(album.to_json) }
    f.close
    f = File.new('movies.json', 'w')
    @movies.each { |movie| f.puts(movie.to_json) }
    f.close
    puts 'Data saved successfully!'.green
    pause(1)
  end
end
