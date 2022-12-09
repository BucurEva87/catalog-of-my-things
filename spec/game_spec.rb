require_relative '../games/game'

describe Game do
  before(:each) do
    @game = Game.new(true, Time.now.year, Time.now.year)
  end

  it 'creates a new instance of the Game class' do
    expect(@game).to be_an_instance_of Game
  end

  it 'properly sets multiplayer value' do
    expect(@game.multiplayer).to eq(true)
  end

  it 'properly sets last_played_at value' do
    expect(@game.last_played_at).to eq(Time.now.year)
  end

  it 'properly sets publish_date value' do
    expect(@game.publish_date).to eq(Time.now.year)
  end

  it 'is not archievable when super does not return true (publish_date <= 10 years)' do
    @game = Game.new(true, Time.now.year, '2020-10-19')
    expect(@game.send(:can_be_archived?)).to eq(false)
  end

  it 'is not archievable when difference between today and last_played_at <= 2 years' do
    @game = Game.new(true, '2021-12-13', '2010-10-19')
    expect(@game.send(:can_be_archived?)).to eq(false)
  end

  it 'is not archievable when both super is false and the difference between today and last_played_at <= 2 years' do
    @game = Game.new(true, Time.now.year, '2020-10-19')
    expect(@game.send(:can_be_archived?)).to eq(false)
  end

  it 'is archievable when super returns true and the difference between today and last_played_at > 2 years' do
    @game = Game.new(true, '2012-08-14', '2010-10-19')
    expect(@game.send(:can_be_archived?)).to eq(true)
  end
end

# Just a comment to be deleted (@Tommymarvel)
