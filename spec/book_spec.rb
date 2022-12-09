require_relative '../books/book'

describe Book do
  before(:each) do
    @book = Book.new('Bloomsbury', 'good', '1997-07-03')
  end

  it 'creates a new instance of the Book class' do
    expect(@book).to be_an_instance_of Book
  end

  it 'properly sets publisher value' do
    expect(@book.publisher).to eq('Bloomsbury')
  end

  it 'properly sets cover_state value' do
    expect(@book.cover_state).to eq('good')
  end

  it 'properly sets publish_date' do
    expect(@book.publish_date).to eq('1997-07-03')
  end

  it 'is not archievable when super does not return true (publish_date <= 10 years)' do
    @book = Book.new('Bloomsbury', 'good', '2014-07-03')
    expect(@book.send(:can_be_archived?)).to eq(false)
  end

  it 'is archievable when super does return true (publish_date > 10 years)' do
    expect(@book.send(:can_be_archived?)).to eq(true)
  end

  it 'is not archievable when cover_state is not "bad"' do
    @book = Book.new('Bloomsbury', 'good', '2014-07-03')
    expect(@book.send(:can_be_archived?)).to eq(false)
  end

  it 'is archievable when cover_state is "bad"' do
    @book = Book.new('Bloomsbury', 'bad', '1997-07-03')
    expect(@book.send(:can_be_archived?)).to eq(true)
  end
end
