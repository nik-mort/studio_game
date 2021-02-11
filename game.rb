require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
class Game
  attr_reader :title
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end

  def load_players(filename)
    File.readlines(filename).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def save_high_scores(to_file='.high_scores.txt')
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores"
      @players.sort.each do |p|
        file.puts high_score_entry(p)
      end
    end
  end

  def high_score_entry(player)
    "#{player.name.ljust(30,'.')} #{player.score}"
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
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
    puts "#{@title} High Scores"
    @players.sort.each do |p|
      puts high_score_entry(p)
    end
    puts "#{total_points} total points from treasures found"
  end

  def play(rounds)
    @players.each do |p|
      puts p
    end
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found."
    treasures.each do |t|
      puts "#{t.name}: #{t.points}pts"
    end
    1.upto(rounds) do |r|
      if block_given?
        break if yield
      end
      puts "\nRound #{r}"
      @players.each do |p|
        GameTurn.take_turn(p)
      end
    end
  end
end