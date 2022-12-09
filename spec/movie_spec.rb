require_relative '../movies/movie'

describe Movie do
  before(:each) do
    @movie = Movie.new(false, '1997-07-03')
  end

  it 'creates a new instance of the Movie class' do
    expect(@movie).to be_an_instance_of Movie
  end

  it 'properly sets silent value' do
    expect(@movie.silent).to eq(false)
  end

  it 'properly sets publish_date' do
    expect(@movie.publish_date).to eq('1997-07-03')
  end

  it 'is archievable when super returns true (publish_date <= 10 years)' do
    expect(@movie.send(:can_be_archived?)).to eq(true)
  end

  it 'is archievable when silent is true' do
    @movie = Movie.new(true, '2014-07-03')
    expect(@movie.send(:can_be_archived?)).to eq(true)
  end

  it 'is archievable when both super returns true and silent is true' do
    @movie = Movie.new(true, '1997-07-03')
    expect(@movie.send(:can_be_archived?)).to eq(true)
  end

  it 'is not archievable when both super returns false and silent is false' do
    @movie = Movie.new(false, '2014-07-03')
    expect(@movie.send(:can_be_archived?)).to eq(false)
  end
end
