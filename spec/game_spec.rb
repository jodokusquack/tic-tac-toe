require './lib/game.rb'

RSpec.describe Game do
  describe "#play" do
    it "cycles through the players" do
      game = Game.new
      players = double("players", :cycle => nil)
      board = double("board", draw: nil)
      game.setup_game(board: board, players:players)

      game.play

      expect(players).to have_received(:cycle)
    end

    it "ends the game when a winner was determined" do
      game = Game.new
      x_player = double("x_player", :sign => "X", :set_move => nil)
      players = double("players", :[] => x_player)
      allow(players).to receive(:cycle).with(nil).and_yield(x_player)
      board = double("board", draw: nil, draw_move: true)
      game.setup_game(players: players, board: board, winner: true)

      expect { game.play }.to output(/Congratulations/).to_stdout
    end

    it "ends the game after 9 moves" do
      game = Game.new
      x_player = double("x_player", :sign => "X", :set_move => nil)
      players = double("players", :[] => x_player)
      allow(players).to receive(:cycle).with(nil).and_yield(x_player)
      board = double("board", draw: nil, draw_move: false)
      game.setup_game(players: players, board: board, moves: 8)

      expect { game.play }.to output(/tie/).to_stdout
    end
  end

  describe "#play_again?" do
    it "returns true if the user enters 'yes'" do
      game = Game.new
      allow(game).to receive(:gets).and_return("yes\n")

      answer = game.play_again?
      expect(answer).to be true
    end

    it "returns false if the user hits enter" do
      game = Game.new
      allow(game).to receive(:gets).and_return("\n")

      answer = game.play_again?
      expect(answer).to be false
    end
  end
end
