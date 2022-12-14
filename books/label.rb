class Label
  attr_reader :title, :color

  def initialize(title, color)
    @id = Random.rand(1...10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_label(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end
end
