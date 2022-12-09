class Author
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1...10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items
    }.to_json(*args)
  end
end

# Just a comment to be deleted (@Tommymarvel)
