class GameBoard
	def initialize
		first_row = ["", "", ""]
		second_row = ["", "", ""]
		third_row = ["", "", ""]
		@row_array = [first_row, second_row, third_row]
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

	def is_game_over?
		if check_rows
			true
		elsif check_columns
			true
		elsif check_diagonals
			true
		else
			false
		end
	end

	def check_rows
		if are_all_row_values_equal? 0
			true
		elsif are_all_row_values_equal? 1
			true
		elsif are_all_row_values_equal? 2
			true
		else
			false
		end
	end

	def are_all_row_values_equal?(row_index)
		first_row_value = @row_array[row_index][0]
		second_row_value = @row_array[row_index][1]
		third_row_value = @row_array[row_index][2]
		(first_row_value == second_row_value && second_row_value == third_row_value && !first_row_value.empty?)
	end

	def check_columns
		if are_all_column_values_equal? 0
			true
		elsif are_all_column_values_equal? 1
			true
		elsif are_all_column_values_equal? 2
			true
		else
			false
		end
	end

	def check_diagonals
		false
	end

	def are_all_column_values_equal?(column_index)
		first_col = @row_array[0][column_index]
		second_col = @row_array[1][column_index]
		third_col = @row_array[2][column_index]
		(first_col == second_col && second_col == third_col && !first_col.empty?)
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
end