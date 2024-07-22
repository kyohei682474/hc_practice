class Pokemon
  attr_reader :name

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

poke = Pokemon.new('ピカチュー')
p poke.name
poke.attack
