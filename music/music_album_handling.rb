def add_music_album_on_spotify
  on_spotify = nil
  loop do
    print "Is this a music album on Spotify? (#{'yes'.green} / #{'no'.red}): "
    on_spotify = gets.chomp.downcase
    break if %w[yes no].include?(on_spotify)

    puts 'A proper value for the on spotify was not provided.'.red
  end
  on_spotify
end

def add_music_album_publish_date
  publish_date = nil
  loop do
    print 'Please provide the publish date of the music album (yyyy-mm-dd): '
    publish_date = gets.chomp
    y, m, d = publish_date.split '-'
    break if Date.valid_date? y.to_i, m.to_i, d.to_i

    puts 'A proper value for the publish date was not provided.'.red
  end
  publish_date
end

def add_genre_name
  name = nil
  loop do
    print 'Please provide the name of the genre: '
    name = gets.chomp
    break unless name.empty?

    puts 'A proper value for the name was not provided'.red
  end
  name
end
