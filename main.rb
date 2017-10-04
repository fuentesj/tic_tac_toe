game_over = false
first_row = ["", "", ""]
second_row = ["", "", ""]
third_row = ["", "", ""]

row_array = [first_row, second_row, third_row]

def draw_game_board(row_array)
	row_array.each_with_index do |current_row, row_index|
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

def add_new_square(row_array, first_index, second_index)
	if row_array[first_index][second_index].empty?
		row_array[first_index][second_index] = "X"
	else
		puts "Square already taken. Please choose another square."
	end
end

puts "Please choose a square:"
puts "tl | tc | tr"
puts "------------"
puts "ml | mc | mr"
puts "------------"
puts "bl | bc | br"
puts "---------------------"
puts "Enter new square: "

while game_over == false
	next_square = gets.chomp
	if (next_square == "tl")
		add_new_square row_array, 0, 0
	elsif (next_square == "tc")
		add_new_square row_array, 0, 1
	elsif (next_square == "tr")
		add_new_square row_array, 0, 2
	elsif (next_square == "ml")
		add_new_square row_array, 1, 0
	elsif (next_square == "mc")
		add_new_square row_array, 1, 1
	elsif (next_square == "mr")
		add_new_square row_array, 1, 2
	elsif (next_square == "bl")	
		add_new_square row_array, 2, 0
	elsif (next_square == "bc")
		add_new_square row_array, 2, 1
	elsif (next_square == "br")
		add_new_square row_array, 2, 2
	else
		puts "Invalid square entered."
	end
	draw_game_board row_array
end
