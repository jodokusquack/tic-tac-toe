#!/usr/bin/env ruby

require_relative "game.rb"
require_relative "board.rb"
require_relative "cell.rb"
require_relative "player.rb"

play_again = true
while play_again
  begin
    system "clear"
    game = Game.new
    game.play()
    play_again = game.play_again?
  rescue Interrupt
    puts("You quit the program")
    exit
  end
end
