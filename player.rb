class Player
  attr_reader :health
  attr_accessor :name
  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}"
  end

  def <=>(other)
    other.score <=> score
  end

  def strong?
    if @health > 100
      true
    else
      false
    end
  end

  def score
    @name.length + @health
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted"
  end
end