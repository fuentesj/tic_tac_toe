require './game_engine'
require './easy_mode'
require './hard_mode'

puts "Welcome to Tic-Tac-Toe"
puts "Please choose a difficulty level (1/2):"
puts "1. Easy"
puts "2. Hard"
selected_difficulty = gets.chomp
if (selected_difficulty == "1")
	easy_difficulty = EasyMode.new
	engine = GameEngine.new(easy_difficulty)
	engine.run
end
if (selected_difficulty == "2")
	hard_difficulty = HardMode.new
	engine = GameEngine.new(hard_difficulty)
	engine.run
end