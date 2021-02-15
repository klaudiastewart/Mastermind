require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'
require './lib/game'
require './lib/timer'
require './lib/turn'

# turn = Turn.new #(board)
# timer = Timer.new #(board)

# code = Code.new(4, "Red", "Blue", "Green", "Yellow")
# code.make_secret_code

game = Game.new #(code)
game.start_welcome
