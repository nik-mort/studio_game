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

  def play
    @players.each do |p|
      puts p
    end
    @players.each do |p|
      GameTurn.take_turn(p)
    end
  end
end