require 'date'
require '../item'
class Game < Item
  def initialize(multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?()
    age = Time.now.year - last_played_at.to_i
    super == true && age > 2
  end
end
