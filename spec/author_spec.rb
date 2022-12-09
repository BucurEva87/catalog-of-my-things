require_relative '../games/game'
require_relative '../games/author'

describe Author do
  before(:each) do
    @author = Author.new('Marvellous', 'ibironke')
  end

  it 'creates a new instance of the Author class' do
    expect(@author).to be_an_instance_of Author
  end

  it 'properly sets first_name value' do
    expect(@author.first_name).to eq('Marvellous')
  end

  it 'properly sets last_name value' do
    expect(@author.last_name).to eq('ibironke')
  end

  it 'properly adds the current author object as the author associated to the added item' do
    @game = Book.new(false, Time.now.year, Time.now.year)
    @author.add_item(@game)
    expect(@game.author).to eq(@author)
  end
end
