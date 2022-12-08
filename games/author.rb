class Author
  attr_accessor :first_name, :last_name
  attr_reader :item

  def initialize(first_name, last_name)
    @id = Random.rand(1...10_000)
    @first_name = first_name
    @last_name = last_name
    @item = []
  end

  def add_item(item)
    @item << item
    item.add_author(self)
  end
end
