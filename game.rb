#/!/usr/bin/env ruby

class Game
  def initialize()
    @winner = false
    @moves = 0
    @board = Board.new
    @board.draw()
    @players = [Player.new("X"), Player.new("O")]
    puts("Game is starting. Player X make your move!")
  end

  def play()
    @players.cycle(nil) do |player|
      begin
        @winner = @board.draw_move(player.sign, *player.set_move())
        @moves += 1
        if @moves == 9 or @winner
          break
        end
      rescue ArgumentError=>e
        @board.draw
        puts "\e[31m#{e.message}\e[0m"
        retry
      end
    end

    if @winner
      puts "\e[32m#{@players[(@moves % 2)-1].sign} won! Congratulations!!\e[0m"
    else
      puts "It's a tie!"
    end
  end
end
