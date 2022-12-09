require './games/game'

describe Game do
  it 'can be archive' do
    game = Game.new('Tom', Time.now.year, Time.now.year)
    expect(game.send(:can_be_archived?)).to eq false
  end

  it 'instance of game' do
    game = Game.new(true, Time.now.year, Time.now.year)
    expect(game).to be_an_instance_of(Game)
  end

  it 'multiplayer game' do
    game = Game.new('Tom', Time.now.year, Time.now.year)
    expect(game.multiplayer).to eq('Tom')
  end

  it 'last played' do
    game = Game.new(true, Time.now.year, Time.now.year)
    expect(game.last_played_at).to eq(Time.now.year)
  end
end
