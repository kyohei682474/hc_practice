class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def hash
    [name, price].hash
  end

  def eql?(other)
    self == other
  end

  def ==(other)
    other.is_a?(Drink) && name == other.name && price == other.price
  end
end
