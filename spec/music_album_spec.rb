require_relative '../music/music_album'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new(true, '2021-10-01')
  end

  it 'creates a new instance of the MusicAlbum class' do
    expect(@music_album).to be_an_instance_of MusicAlbum
  end

  it 'properly sets on_spotify value' do
    expect(@music_album.on_spotify).to eq(true)
  end

  it 'properly sets publish_date' do
    expect(@music_album.publish_date).to eq('2021-10-01')
  end

  it 'is not archievable when super does not return true (publish_date <= 10 years)' do
    expect(@music_album.send(:can_be_archived?)).to eq(false)
  end

  it 'is not archievable when on_spotify is not true' do
    @music_album = MusicAlbum.new(false, '2001-10-01')
    expect(@music_album.send(:can_be_archived?)).to eq(false)
  end

  it 'is not archievable when both super returns false and on_spotify is false' do
    @music_album = MusicAlbum.new(false, '2021-10-01')
    expect(@music_album.send(:can_be_archived?)).to eq(false)
  end

  it 'is archievable when both super returns true and on_spotify is true' do
    @music_album = MusicAlbum.new(true, '2001-10-01')
    expect(@music_album.send(:can_be_archived?)).to eq(true)
  end
end
