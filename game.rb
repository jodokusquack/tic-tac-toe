#/!/usr/bin/env ruby

class Game
  def initialize()
    @winner = false
    @moves = 0
    @board = Board.new
    @board.draw()
    @players = [Player.new("X"), Player.new("O")]
    puts("A new game has started.\n ")
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

  def play_again?()
    puts("Do you want to play again? [y/N]")
    input = gets.chomp
    if input[0].is_a?(String) and input[0].capitalize == "Y"
      return true
    else
      puts("Thanks for playing")
      return false
    end
  end
end

