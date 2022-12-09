require_relative '../books/book'
require_relative '../books/label'

describe Label do
  before(:each) do
    @label = Label.new('The masque of the Red Death', 'red')
  end

  it 'creates a new instance of the Label class' do
    expect(@label).to be_an_instance_of Label
  end

  it 'properly sets title value' do
    expect(@label.title).to eq('The masque of the Red Death')
  end

  it 'property sets color value' do
    expect(@label.color).to eq('red')
  end

  it 'properly adds the current label object as the label associated to the added item' do
    @book = Book.new('Bloomsbury', 'good', '1997-07-03')
    @label.add_item(@book)
    expect(@book.label).to eq(@label)
  end
end
