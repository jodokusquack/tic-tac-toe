require './lib/board.rb'
require './lib/cell.rb'

RSpec.describe Board do
  describe "#draw_move" do
    it "adds the sign to the board" do
      cell = double("Cell", content: " ", :content= => nil)
      allow(cell).to receive(:[]).and_return(cell)
      board = Board.new
      board.cells = cell
      allow(board).to receive(:draw)

      board.draw_move("X", 0, 0)

      expect(board).to have_received(:draw)
      expect(board.cells).to have_received(:content=)
    end

    it "raises an Error if the cell is already occupied" do
      cell = double("Cell", :content => "O", :content= => nil)
      allow(cell).to receive(:[]).and_return(cell)
      board = Board.new
      board.cells = cell
      allow(board).to receive(:draw)

      expect { board.draw_move("X", 0, 0) }.to raise_error(ArgumentError)

      expect(cell).to have_received(:content)
    end

    it "returns false if a player has not yet won" do
      board = Board.new
      allow(board).to receive(:draw)

      expect( board.draw_move("X", 0, 0) ).to be false
    end

    it "returns true if a player has completed a row" do
      board = Board.new
      allow(board).to receive(:draw)

      board.draw_move("X", 0, 0)
      board.draw_move("X", 1, 0)

      expect( board.draw_move("X", 2, 0) ).to be true
    end

    it "returns true if a player has completed a column" do
      board = Board.new
      allow(board).to receive(:draw)

      board.draw_move("X", 0, 0)
      board.draw_move("X", 0, 1)

      expect( board.draw_move("X", 0, 2) ).to be true
    end

    it "returns true if a player has completed a diagonal" do
      board = Board.new
      allow(board).to receive(:draw)

      board.draw_move("O", 0, 0)
      board.draw_move("O", 1, 1)

      expect( board.draw_move("O", 2, 2) ).to be true
    end
  end
end
