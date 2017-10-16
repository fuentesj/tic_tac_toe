class EasyMode
	def make_move(game_board, player)
		sleep(3)
		row_index = 0 + rand(2)
		col_index = 0 + rand(2)
		computer_added_square = game_board.add_new_square row_index, col_index, "O"
		while (computer_added_square == false)
			row_index = 0 + rand(2)
			col_index = 0 + rand(2)
			computer_added_square = game_board.add_new_square row_index, col_index, "O"
		end
	end
end