require_relative 'game'

describe Game do
  before do
    $stdout = StringIO.new
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
  end
  it "A die roll of a high number w00ts the player" do
    allow_any_instance_of(Die).to receive(:roll).and_return(5)
    @game.play(2)
    expect(@player.health).to eq(@initial_health + 15*2)
  end
  it "A die roll of a middle number skips the player" do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)
    @game.play(2)
    expect(@player.health).to eq(@initial_health)
  end
  it "A die roll of a low number blams the player" do
    allow_any_instance_of(Die).to receive(:roll).and_return(1)
    @game.play(2)
    expect(@player.health).to eq(@initial_health - 10*2)
  end

end

