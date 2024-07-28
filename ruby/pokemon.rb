module NameService
  def name_change(newname)
    if newname == 'うんこ'
      puts "不適切な名前です。"
    else
      @name = newname
    end
  end

  def get_name 
    name
  end

end

class Pokemon
  include NameService
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



  private 
  def name=(value)
    @name = value
  end

end

class Pikachu < Pokemon # rubocop:disable Style/Documentation 

  def initialize(name, type1, type2, hp)
    super
  end

    def attack
      super
      puts "#{get_name}の10万ボルト"
    end
  
end

class Player
  include NameService
end

poke = Pikachu.new('ピカチュウ', 'でんき', '_', 100)
p poke.name

poke.attack
