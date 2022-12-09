def add_movie_silent
  silent = nil
  loop do
    print "Is this a silent movie? (#{'yes'.green} / #{'no'.red}): "
    silent = gets.chomp.downcase
    break if %w[yes no].include?(silent)

    puts 'A proper value for the silent was not provided.'.red
  end
  silent
end

def add_movie_publish_date
  publish_date = nil
  loop do
    print 'Please provide the publish date of the movie (yyyy-mm-dd): '
    publish_date = gets.chomp
    y, m, d = publish_date.split '-'
    break if Date.valid_date? y.to_i, m.to_i, d.to_i

    puts 'A proper value for the publish date was not provided.'.red
  end
  publish_date
end

def add_source_name
  name = nil
  loop do
    print 'Please provide the name of the source: '
    name = gets.chomp
    break unless name.empty?

    puts 'A proper value for the name was not provided'.red
  end
  name
end
