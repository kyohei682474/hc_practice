class VendingMachine 
  def initialize(quantity)
    @quantity = quantity
  end

  def quantity
    @quantity
  end
  def quantity=(value)
    @quantity = value
  end
end

vending_machine = VendingMachine.new(5)
p vending_machine.quantity