require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
class Game
  attr_reader :title
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong?}
    puts "\n#{@title} Statistics"
    puts "\n #{strong_players.count} Strong Players"
    strong_players.each do |p|
      puts p
    end
    puts "\n #{wimpy_players.count} Wimpy Players"
    wimpy_players.each do |p|
      puts p
    end
    puts "#{@title} High Scores"
    @players.sort.each do |p|
      puts "#{p.name.ljust(30,'.')} #{p.score}"
    end
  end

  def play(rounds)
    @players.each do |p|
      puts p
    end
    1.upto(rounds) do |r|
      puts "\nRound #{r}"
      @players.each do |p|
        GameTurn.take_turn(p)
        puts p
      end
    end
  end
end