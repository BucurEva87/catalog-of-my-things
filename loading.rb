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

  def load_labels
    return unless File.file?('labels.json')

    f = File.new('labels.json', 'r')
    f.readlines.each do |label|
      data = JSON.parse(label)
      @labels << Label.new(data['title'], data['color'])
      data['items'].each do |item|
        @books << Book.new(item['publisher'], item['cover_state'], item['publish_date'])
        @labels.last.add_item(@books.last)
      end
    end
  end

  def load_authors
    return unless File.file?('authors.json')

    f = File.new('authors.json', 'r')
    f.readlines.each do |author|
      data = JSON.parse(author)
      @authors << Author.new(data['first_name'], data['last_name'])
      data['items'].each do |item|
        @games << Game.new(item['multiplayer'], item['last_played_at'], item['publish_date'])
        @authors.last.add_item(@games.last)
      end
    end
  end

  def load_genres
    return unless File.file?('genres.json')

    f = File.new('genres.json', 'r')
    f.readlines.each do |genre|
      data = JSON.parse(genre)
      @genres << Genre.new(data['name'])
      data['items'].each do |item|
        @music_albums << MusicAlbum.new(item['on_spotify'], item['publish_date'])
        @genres.last.add_item(@music_albums.last)
      end
    end
  end

  def load_sources
    return unless File.file?('sources.json')

    f = File.new('sources.json', 'r')
    f.readlines.each do |source|
      data = JSON.parse(source)
      @sources << Source.new(data['name'])
      data['items'].each do |item|
        @movies << Movie.new(item['silent'], item['publish_date'])
        @sources.last.add_item(@movies.last)
      end
    end
  end

  def store_data
    puts 'Saving data to local files...'.blue
    pause
    f = File.new('labels.json', 'w')
    @labels.each { |label| f.puts(label.to_json) }
    f.close
    f = File.new('authors.json', 'w')
    @authors.each { |author| f.puts(author.to_json) }
    f.close
    f = File.new('genres.json', 'w')
    @genres.each { |genre| f.puts(genre.to_json) }
    f.close
    f = File.new('sources.json', 'w')
    @sources.each { |source| f.puts(source.to_json) }
    f.close
    puts 'Data saved successfully!'.green
    pause(1)
  end
end
