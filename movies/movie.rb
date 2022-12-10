require_relative '../item'

class Movie < Item
  attr_reader :silent

  def initialize(silent, publish_date)
    super(publish_date)
    @silent = silent
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'silent' => @silent,
      'publish_date' => @publish_date,
      'label' => @label,
      'author' => @author,
      'genre' => @genre,
      'source' => @source
    }.to_json(*args)
  end

  private

  def can_be_archived?()
    super || @silent
  end
end
