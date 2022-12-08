require './games/author'

describe Author do
  it 'instance of author' do
    auth = Author.new('Marvellous', 'ibironke')
    expect(auth).to be_an_instance_of Author
  end
  it 'first_name equals' do
    auth = Author.new('Marvellous', 'ibironke')
    expect(auth.first_name).to eq('Marvellous')
  end
  it 'last_name equals' do
    auth = Author.new('Marvellous', 'ibironke')
    expect(auth.last_name).to eq('ibironke')
  end
end
