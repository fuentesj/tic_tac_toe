class HardMode

	@maximizer_player
	@minimizer_player

	def make_move(game_board, maximizer_player)
		if maximizer_player == "X"
			@maximizer_player = "X"
			@minimizer_player = "O"
		else 
			@maximizer_player = "O"
			@minimizer_player = "X"
		end

		game_states = {}
		all_available_spots = game_board.return_all_available_spots
		all_available_spots.each do | current_move |
			game_board_deep_copy = Marshal.load(Marshal.dump(game_board))
			ranking = minimax(game_board_deep_copy, @maximizer_player, current_move)
			game_states[current_move] = ranking
		end
		next_move = game_states.key(game_states.values.max)

		game_board.add_new_square next_move[0], next_move[1], "O"
	end

	def minimax(game_board, player, initial_move)
		game_board.add_new_square(initial_move[0], initial_move[1], player)
		return recursive_minimax(game_board, @minimizer_player)
	end

	def recursive_minimax(game_board, player)
		if game_board.is_game_over?(@maximizer_player)
			return 10
		elsif game_board.is_game_over?(@minimizer_player)
			return -10
		elsif game_board.is_game_a_draw?
			return 0
		else 
			if player == @maximizer_player
				minimax_rankings = []
				game_board.row_array.each_with_index do |current_row, row_index|
					current_row.each_with_index do |current_element, index|
						if current_element.empty?
							game_board.add_new_square(row_index, index, @maximizer_player)
							next_value = recursive_minimax(game_board, @minimizer_player)
							minimax_rankings.push(next_value)
						end
					end
				end
				return minimax_rankings.max
			else
				minimax_rankings = []
				game_board.row_array.each_with_index do |current_row, row_index|
					current_row.each_with_index do |current_element, index|
						if current_element.empty?
							game_board.add_new_square(row_index, index, @minimizer_player)
							next_value = recursive_minimax(game_board, @maximizer_player)
							minimax_rankings.push(next_value)
						end
					end
				end
				return minimax_rankings.min
			end
		end
	end

end