class Pokemon
  attr_reader :name, :type1, :type2, :hp

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{@name}の攻撃"
  end
end

rizardon = Pokemon.new('リザードン', 'ほのう', 'ひこう', 100)
p rizardon.name
p rizardon.type1
rizardon.attack
