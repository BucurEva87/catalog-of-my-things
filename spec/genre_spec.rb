require './genre'
require './music_album'

describe Genre do
  context 'when initialized' do
    it 'Should create a genre' do
      music = MusicAlbum.new('2022-10-01', false)
      genre = Genre.new('Ali')
      genre.add_item(music)
      expect(genre.name).to eq('Ali')
    end
  end
end
