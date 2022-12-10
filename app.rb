require 'json'
require './loading'
require './books/book'
require './books/label'
require './games/game'
require './games/author'
require './music/genre'
require './music/music_album'
require './movies/movie'
require './movies/source'
require './console_helper'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @music_albums = []
    @genres = []
    @movies = []
    @sources = []
    puts 'Loading data from local files...'.blue
    pause(2)
    list = { books: @books, labels: @labels, games: @games, authors: @authors, music_albums: @music_albums,
             genres: @genres, movies: @movies, sources: @sources }
    @loading = Loading.new(list)
    @loading.load_books
    @loading.load_games
    @loading.load_music_albums
    @loading.load_movies
    puts 'Data loaded succesfully!'.green
    pause(1)
  end

  def list_all_books
    if @books.length.zero?
      puts 'There are no books in your catalog for the time being. Maybe add one...?'
    else
      @books.each_with_index do |b, i|
        puts "#{i + 1}) Publisher: #{b.publisher} | Publish date: #{b.publish_date} | Cover state: #{b.cover_state}"
      end
    end
  end

  def list_all_labels
    if @labels.length.zero?
      puts 'There are no labels in your catalog for the time being. Maybe add one...?'
    else
      @labels.each_with_index do |l, i|
        puts "#{i + 1}) Title: #{l.title} | Color: #{l.color}"
      end
    end
  end

  def add_book(list)
    publisher, cover_state, publish_date, title, color, first_name, last_name, genre_name, source_name = list
    @books << Book.new(publisher, cover_state, publish_date)
    @labels << Label.new(title, color)
    @authors << Author.new(first_name, last_name)
    @genres << Genre.new(genre_name)
    @sources << Source.new(source_name)
    add_to_items(@books.last)
    puts 'The provided book was successfully added!'.green
    pause
  end

  def list_all_games
    if @games.length.zero?
      puts 'There are no games in your catalog for the time being. Maybe add one...?'
    else
      @games.each_with_index do |g, i|
        puts "#{i + 1}) Multiplayer: #{g.multiplayer} | Publish date:
         #{g.publish_date} | Last played: #{g.last_played_at}"
      end
    end
  end

  def list_all_authors
    if @authors.length.zero?
      puts 'There are no authors in your catalog for the time being. Maybe add one...?'
    else
      @authors.each_with_index do |a, i|
        puts "#{i + 1}) First name: #{a.first_name} | Last name: #{a.last_name}"
      end
    end
  end

  def add_game(list)
    multiplayer, last_played_at, publish_date, title, color, first_name, last_name, genre_name, source_name = list
    @games << Game.new(multiplayer, last_played_at, publish_date)
    @labels << Label.new(title, color)
    @authors << Author.new(first_name, last_name)
    @genres << Genre.new(genre_name)
    @sources << Source.new(source_name)
    add_to_items(@games.last)
    puts 'The provided game was successfully added!'.green
  end

  def list_all_music_albums
    if @music_albums.length.zero?
      puts 'There are no music albums in your catalog for the time being. Maybe add one...?'
    else
      @music_albums.each_with_index do |m, i|
        puts "#{i + 1}) On spotify: #{m.on_spotify} | Publish date: #{m.publish_date}"
      end
    end
  end

  def list_all_genres
    if @genres.length.zero?
      puts 'There are no genres in your catalog for the time being. Maybe add one...?'
    else
      @genres.each_with_index do |g, i|
        puts "#{i + 1}) Name: #{g.name}"
      end
    end
  end

  def add_music_album(list)
    on_spotify, publish_date, title, color, first_name, last_name, genre_name, source_name = list
    @music_albums << MusicAlbum.new(on_spotify, publish_date)
    @labels << Label.new(title, color)
    @authors << Author.new(first_name, last_name)
    @genres << Genre.new(genre_name)
    @sources << Source.new(source_name)
    add_to_items(@music_albums.last)
    puts 'The provided music album was successfully added!'.green
  end

  def list_all_movies
    if @movies.length.zero?
      puts 'There are no movies in your catalog for the time being. Maybe add one...?'
    else
      @movies.each_with_index do |m, i|
        puts "#{i + 1}) Silent: #{m.silent} | Publish date: #{m.publish_date}"
      end
    end
  end

  def list_all_sources
    if @sources.length.zero?
      puts 'There are no sources in your catalog for the time being. Maybe add one...?'
    else
      @sources.each_with_index do |s, i|
        puts "#{i + 1}) Name: #{s.name}"
      end
    end
  end

  def add_movie(list)
    silent, publish_date, title, color, first_name, last_name, genre_name, source_name = list
    @movies << Movie.new(silent, publish_date)
    @labels << Label.new(title, color)
    @authors << Author.new(first_name, last_name)
    @genres << Genre.new(genre_name)
    @sources << Source.new(source_name)
    add_to_items(@movies.last)
    puts 'The provided movie was successfully added!'.green
  end

  def add_to_items(item)
    @labels.last.add_item(item)
    @authors.last.add_item(item)
    @genres.last.add_item(item)
    @sources.last.add_item(item)
  end

  def quit_app
    @loading.store_data
    puts 'I bid you farewell!'
    pause(2)
    clear_terminal
    exit(true)
  end
end
