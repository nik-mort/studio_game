require_relative 'treasure_trove'
class Player
  attr_reader :health
  attr_accessor :name
  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm Larry. health = #{@health}, points = #{points}, score = #{score}"
  end

  def <=>(other)
    other.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points}pts!"
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def strong?
    if @health > 100
      true
    else
      false
    end
  end

  def score
    @health + points
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