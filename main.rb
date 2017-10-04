require './gameboard'

game_board = GameBoard.new

puts "Please choose a square:"
puts "tl | tc | tr"
puts "------------"
puts "ml | mc | mr"
puts "------------"
puts "bl | bc | br"
puts "---------------------"
puts "Enter new square: "

while game_board.is_game_over? == false
	next_square = gets.chomp
	if (next_square == "tl")
		game_board.add_new_square 0, 0
	elsif (next_square == "tc")
		game_board.add_new_square 0, 1
	elsif (next_square == "tr")
		game_board.add_new_square 0, 2
	elsif (next_square == "ml")
		game_board.add_new_square 1, 0
	elsif (next_square == "mc")
		game_board.add_new_square 1, 1
	elsif (next_square == "mr")
		game_board.add_new_square 1, 2
	elsif (next_square == "bl")	
		game_board.add_new_square 2, 0
	elsif (next_square == "bc")
		game_board.add_new_square 2, 1
	elsif (next_square == "br")
		game_board.add_new_square 2, 2
	else
		puts "Invalid square entered."
	end
		game_board.draw_game_board
end