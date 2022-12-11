require 'date'

class Item
  attr_reader :genre, :author, :source, :label, :publish_date

  def initialize(publish_date)
    @id = rand(1...10_000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.now.year - @publish_date.to_i > 10
  end
end
