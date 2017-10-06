require './gameboard'

game_board = GameBoard.new

puts "Please choose a square:"
puts "tl | tc | tr"
puts "------------"
puts "ml | mc | mr"
puts "------------"
puts "bl | bc | br"
puts "---------------------"
puts "Player's move: "

while game_board.is_game_over? == false
	next_square = gets.chomp
	if (next_square == "tl")
		game_board.add_new_square 0, 0, "player1"
	elsif (next_square == "tc")
		game_board.add_new_square 0, 1, "player1"
	elsif (next_square == "tr")
		game_board.add_new_square 0, 2, "player1"
	elsif (next_square == "ml")
		game_board.add_new_square 1, 0, "player1"
	elsif (next_square == "mc")
		game_board.add_new_square 1, 1, "player1"
	elsif (next_square == "mr")
		game_board.add_new_square 1, 2, "player1"
	elsif (next_square == "bl")	
		game_board.add_new_square 2, 0, "player1"
	elsif (next_square == "bc")
		game_board.add_new_square 2, 1, "player1"
	elsif (next_square == "br")
		game_board.add_new_square 2, 2, "player1"
	else
		puts "Invalid square entered."
	end
	game_board.check_if_game_over
	game_board.draw_game_board
	puts ""
	puts "---------------------"
	puts "Computer's move:"
	game_board.computer_move
	game_board.check_if_game_over
	game_board.draw_game_board
	puts ""
	puts "---------------------"
	puts "Player move: "
end