require_relative '../music/genre'
require_relative '../music/music_album'

describe Genre do
  before(:each) do
    @genre = Genre.new('Ali')
  end

  it 'creates a new instance of the Genre class' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'properly sets name value' do
    expect(@genre.name).to eq('Ali')
  end

  it 'properly adds the current genre object as the genre associated to the added item' do
    @music = MusicAlbum.new(false, '2022-10-01')
    @genre.add_item(@music)
    expect(@music.genre).to eq(@genre)
  end
end

# Just a comment to be deleted (@SaeqaSultani)
