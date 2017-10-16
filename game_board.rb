class GameBoard

	attr_accessor :row_array

	def initialize
		first_row = ["", "", ""]
		second_row = ["", "", ""]
		third_row = ["", "", ""]
		@row_array = [first_row, second_row, third_row]
	end

	def return_all_available_spots
		available_spots = []
		@row_array.each_with_index do |current_row, row_index|
			current_row.each_with_index do |current_element, column_index|
				if (current_element.empty?)
					available_spots.push([row_index, column_index])
				end
			end
		end
		return available_spots
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

	def is_game_over?(player = nil)
		if is_game_over_in_rows?(player)
			true
		elsif is_game_over_in_columns?(player)
			true
		elsif is_game_over_in_diagonals?(player)
			true
		else
			false
		end
	end

	def is_game_over_in_rows?(player = nil)
		if do_rows_contain_end_state?(0, player)
			true
		elsif do_rows_contain_end_state?(1, player)
			true
		elsif do_rows_contain_end_state?(2, player)
			true
		else
			false
		end
	end

	def do_rows_contain_end_state?(row_index, player = nil)
		first_row_value = @row_array[row_index][0]
		second_row_value = @row_array[row_index][1]
		third_row_value = @row_array[row_index][2]
		do_values_match = (first_row_value == second_row_value && second_row_value == third_row_value && !first_row_value.empty?)
		if player.nil?
			do_values_match
		else
			if do_values_match
				first_row_value == player
			else
				do_values_match
			end
		end
	end

	def is_game_over_in_columns?(player = nil)
		if does_column_contain_end_state?(0, player)
			true
		elsif does_column_contain_end_state?(1, player)
			true
		elsif does_column_contain_end_state?(2, player)
			true
		else
			false
		end
	end

	def is_game_over_in_diagonals?(player = nil)
		does_first_diagonal_contain_end_state?(player) || does_second_diagonal_contain_end_state?(player)
	end

	def does_first_diagonal_contain_end_state?(player = nil)
		first_row_value = @row_array[0][0]
		second_row_value = @row_array[1][1]
		third_row_value = @row_array[2][2]
		do_values_match = (first_row_value == second_row_value && second_row_value == third_row_value && !first_row_value.empty?)
		if player.nil?
			do_values_match
		else
			if do_values_match
				first_row_value == player
			else
				do_values_match
			end
		end
	end

	def does_second_diagonal_contain_end_state?(player = nil)
		first_row_value = @row_array[0][2]
		second_row_value = @row_array[1][1]
		third_row_value = @row_array[2][0]
		do_values_match = (first_row_value == second_row_value && second_row_value == third_row_value && !first_row_value.empty?)
		if player.nil?
			do_values_match
		else
			if do_values_match
				first_row_value == player
			else
				do_values_match
			end
		end
	end

	def does_column_contain_end_state?(column_index, player = nil)
		first_col = @row_array[0][column_index]
		second_col = @row_array[1][column_index]
		third_col = @row_array[2][column_index]
		do_values_match = (first_col == second_col && second_col == third_col && !first_col.empty?)
		if player.nil?
			do_values_match
		else
			if do_values_match
				first_col == player
			else
				do_values_match
			end
		end
	end

	def add_new_square(first_index, second_index, player)
		if player == "X"
			player_char = "X"
		elsif player == "O"
			player_char = "O"
		else 
			# Raise Exception?
		end
		if @row_array[first_index][second_index].empty?
			@row_array[first_index][second_index] = player_char
			true
		else
			false
		end
	end

	def is_game_a_draw?
		available_spots = return_all_available_spots
		if available_spots.empty? && is_game_over?("X") == false && is_game_over?("O") == false
			return true
		else
			return false
		end
	end
end