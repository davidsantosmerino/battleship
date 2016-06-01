require 'pry'
Dir["./lib/*"].each {|file| require file }

game = Game.new
game.start
