require './game_board'

class GameEngine
	def initialize(difficulty_level)
		@game_board = GameBoard.new
		@difficulty_level = difficulty_level
	end

	def run
		puts "Please choose a square:"
		puts "tl | tc | tr"
		puts "------------"
		puts "ml | mc | mr"
		puts "------------"
		puts "bl | bc | br"
		puts "---------------------"
		puts "Player's move: "
		while @game_board.is_game_over? == false
			next_square = gets.chomp
			if (next_square == "tl")
				@game_board.add_new_square 0, 0, "X"
			elsif (next_square == "tc")
				@game_board.add_new_square 0, 1, "X"
			elsif (next_square == "tr")
				@game_board.add_new_square 0, 2, "X"
			elsif (next_square == "ml")
				@game_board.add_new_square 1, 0, "X"
			elsif (next_square == "mc")
				@game_board.add_new_square 1, 1, "X"
			elsif (next_square == "mr")
				@game_board.add_new_square 1, 2, "X"
			elsif (next_square == "bl")	
				@game_board.add_new_square 2, 0, "X"
			elsif (next_square == "bc")
				@game_board.add_new_square 2, 1, "X"
			elsif (next_square == "br")
				@game_board.add_new_square 2, 2, "X"
			else
				puts "Invalid square entered."
			end
			if @game_board.is_game_over?
				puts "Player Wins!"
				@game_board.draw_game_board
				break
			elsif @game_board.is_game_a_draw?
				puts "Draw!"
				@game_board.draw_game_board
				break
			end
			@game_board.draw_game_board
			puts ""
			puts "---------------------"
			puts "Computer's move:"
			@difficulty_level.make_move(@game_board, "O")
			if @game_board.is_game_over?
				puts "Computer Wins!"
				@game_board.draw_game_board
				break
			elsif @game_board.is_game_a_draw?
				puts "Draw!"
				@game_board.draw_game_board
				break
			end
			@game_board.draw_game_board
			puts ""
			puts "---------------------"
			puts "Player's move: "
		end
	end
end