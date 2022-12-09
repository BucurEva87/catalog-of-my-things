require './music_album'

describe MusicAlbum do
  context 'when initialized' do
    it 'Should create a music album' do
      music = MusicAlbum.new('2021-10-01', true)
      expect(music.on_spotify).to eq(true)
      expect(music.can_be_archived?).to be(false)
    end
  end
end
