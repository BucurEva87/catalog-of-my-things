require_relative '../movies/movie'
require_relative '../movies/source'

describe Source do
  before(:each) do
    @source = Source.new('online')
  end

  it 'creates a new instance of the Source class' do
    expect(@source).to be_an_instance_of Source
  end

  it 'properly sets name value' do
    expect(@source.name).to eq('online')
  end

  it 'properly adds the current source object as the source associated to the added item' do
    @movie = Movie.new(false, '1997-07-03')
    @source.add_item(@movie)
    expect(@movie.source).to eq(@source)
  end
end
