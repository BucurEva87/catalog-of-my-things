require './genre'
require './item'

describe Genre do
  context 'when initialized' do
    it 'Should create a genre' do
      genre = Genre.new('Ali')
      item = Item.new('2022-10-01')
      genre.add_item(item)
      expect(genre.name).to eq('Ali')
    end
  end
end
