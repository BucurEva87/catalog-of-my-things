require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date,
      'label' => @label,
      'author' => @author,
      'genre' => @genre,
      'source' => @source
    }.to_json(*args)
  end

  private

  def can_be_archived?()
    super && @on_spotify
  end
end
