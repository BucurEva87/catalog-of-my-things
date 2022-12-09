class Genre
  attr_reader :name

  def initialize(name)
    @id = Random.rand(1...10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end
end

# Just a comment to be deleted (@SaeqaSultani)
