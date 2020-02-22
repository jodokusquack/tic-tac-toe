#!/usr/bin/env ruby

require_relative "game.rb"
require_relative "board.rb"
require_relative "cell.rb"
require_relative "player.rb"

game = Game.new
game.play()
