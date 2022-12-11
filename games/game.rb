require 'date'
require_relative '../item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => @publish_date,
      'label' => @label,
      'author' => @author,
      'genre' => @genre,
      'source' => @source
    }.to_json(*args)
  end

  private

  def can_be_archived?
    age = Time.now.year - @last_played_at.to_i
    super && age > 2
  end
end
