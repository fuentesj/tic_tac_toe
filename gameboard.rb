class GameBoard

	def initialize
		first_row = ["", "", ""]
		second_row = ["", "", ""]
		third_row = ["", "", ""]
		@row_array = [first_row, second_row, third_row]
		@game_over = false
	end

	def draw_game_board
		@row_array.each_with_index do |current_row, row_index|
			current_row.each_with_index do |current_element, index|
				unless current_element.empty?
					if (index == current_row.length - 1)
						printf "\s#{current_element}\s\n"
					else
						print "\s#{current_element}\s|"
					end
				else
					if (index == current_row.length - 1)
						print "\s\s\s\n"
					else
						print "\s\s\s|"
					end
				end
			end 
			if (row_index != current_row.length-1)
				print "-----------\n"
			end
		end
	end

	def check_if_game_over

	end

	def add_new_square(first_index, second_index, player)
		if player == "player1"
			player_char = "X"
		else
			player_char = "O"
		end
		if @row_array[first_index][second_index].empty?
			@row_array[first_index][second_index] = player_char
			true
		else
			false
		end
	end

	def computer_move()
		sleep(3)
		row_index = 0 + rand(2)
		col_index = 0 + rand(2)
		computer_added_square = add_new_square row_index, col_index, "player2"
		while (computer_added_square == false)
			row_index = 0 + rand(2)
			col_index = 0 + rand(2)
			computer_added_square = add_new_square row_index, col_index, "player2"
		end
	end

	def is_game_over?
		@game_over
	end
end