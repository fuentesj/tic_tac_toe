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
				if (index == current_row.length - 1)
					print current_element + "\n"
				else
					print current_element + "  | "
				end
			end 
			if (row_index != current_row.length-1)
				print "----------\n"
			end
		end
	end

	def add_new_square(first_index, second_index)
		if @row_array[first_index][second_index].empty?
			@row_array[first_index][second_index] = "X"
		else
			puts "Square already taken. Please choose another square."
		end
	end

	def is_game_over?
		@game_over
	end
end