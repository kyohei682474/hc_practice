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

class Pikachu < Pokemon # rubocop:disable Style/Documentation
  def initialize(name, type1, type2, hp)
    super

    def attack
      super
      puts '10万ボルト'
    end
  end
end

poke = Pikachu.new('ピカチュウ', 'でんき', '_', 100)
p poke.name
poke.attack
