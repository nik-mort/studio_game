module GameTurn
  require_relative 'player'
  require_relative 'die'
  require_relative 'loaded_die'

  def self.take_turn(player)
    die = Die.new
    number_rolled = die.roll
    case number_rolled
    when 5..6
      player.w00t
    when 3..4
      puts "#{player.name} got skipped"
    else
      player.blam
    end
    t_found = TreasureTrove.random
    player.found_treasure(t_found)
  end
end
