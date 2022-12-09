def add_game_multiplayer
  multiplayer = nil
  loop do
    print "Is this a multiplayer game? (#{'yes'.green} / #{'no'.red}): "
    multiplayer = gets.chomp.downcase
    break if %w[yes no].include?(multiplayer)

    puts 'A proper value for the multiplayer was not provided.'.red
  end
  multiplayer
end

def add_game_last_played_at
  last_played_at = nil
  loop do
    print 'Please provide the last date this game was played: '
    last_played_at = gets.chomp
    y, m, d = last_played_at.split '-'
    break if Date.valid_date? y.to_i, m.to_i, d.to_i

    puts 'A proper value for the last played date was not provided.'.red
  end
  last_played_at
end

def add_game_publish_date
  publish_date = nil
  loop do
    print 'Please provide the publish date of the game (yyyy-mm-dd): '
    publish_date = gets.chomp
    y, m, d = publish_date.split '-'
    break if Date.valid_date? y.to_i, m.to_i, d.to_i

    puts 'A proper value for the publish date was not provided.'.red
  end
  publish_date
end

def add_author_first_name
  first_name = nil
  loop do
    print 'Please provide the first name of the author: '
    first_name = gets.chomp
    break unless first_name.empty?

    puts 'A proper value for the first name was not provided'.red
  end
  first_name
end

def add_author_last_name
  last_name = nil
  loop do
    print 'Please provide the last name of the author: '
    last_name = gets.chomp
    break unless last_name.empty?

    puts 'A proper value for the last name was not provided'.red
  end
  last_name
end
