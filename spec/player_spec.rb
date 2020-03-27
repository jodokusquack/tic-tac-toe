require './lib/player.rb'

RSpec.describe Player do
  describe "#set_move" do
    it "returns the row and column on correct input" do
      player = Player.new("X")
      allow(player).to receive(:gets).and_return("3:2\n")

      row, col = player.set_move

      expect(row).to be 2
      expect(col).to be 1
    end

    it "raises an error on incorrect input" do
      player = Player.new("X")
      allow(player).to receive(:gets).and_return("incorrect\n", "4:3\n")

      expect { player.set_move }.to raise_error(ArgumentError)
      expect { player.set_move }.to raise_error(ArgumentError)
    end
  end
end
