def add_book_publisher
  publisher = nil
  loop do
    print 'Please provide the publisher of the book: '
    publisher = gets.chomp
    break unless publisher.empty?

    puts 'A proper value for the publisher was not provided.'.red
  end
  publisher
end

def add_book_cover_state
  cover_state = nil
  loop do
    print "Please provide the cover state of the book (#{'good'.green} / #{'bad'.red}): "
    cover_state = gets.chomp.downcase
    break if %w[good bad].include?(cover_state)

    puts 'A proper value for the cover state was not provided.'.red
  end
  cover_state
end

def add_book_publish_date
  publish_date = nil
  loop do
    print 'Please provide the publish date of the book (yyyy-mm-dd): '
    publish_date = gets.chomp
    y, m, d = publish_date.split '-'
    break if Date.valid_date? y.to_i, m.to_i, d.to_i

    puts 'A proper value for the publish date was not provided.'.red
  end
  publish_date
end

def add_label_title
  title = nil
  loop do
    print 'Please provide a title for this label: '
    title = gets.chomp
    break unless title.empty?

    puts 'A proper value for the title was not provided'.red
  end
  title
end

def add_label_color
  color = nil
  loop do
    print 'Please provide a color for this label: '
    color = gets.chomp
    break unless color.empty?

    puts 'A proper value for the color was not provided'.red
  end
  color
end
