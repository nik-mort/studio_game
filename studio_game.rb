require_relative 'game'

knuckleheads = Game.new('Knuckleheads')
knuckleheads.load_players(ARGV.shift || 'players.csv')
loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(Integer(answer))
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
    else puts "Please enter a number or 'quit'"
  end
  knuckleheads.save_high_scores
end


knuckleheads.print_stats

