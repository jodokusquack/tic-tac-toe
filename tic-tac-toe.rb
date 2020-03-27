#!/usr/bin/env ruby

Dir["lib/*.rb"].each { |file| require_relative file }

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
