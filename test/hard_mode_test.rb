require_relative '../game_board'
require_relative '../hard_mode'

describe "HardMode" do 
	before(:each) do
		@game_board = GameBoard.new
		@hard_mode = HardMode.new
	end

	#OXX
	#XOO
	#O


	it "will return true when there are three O's in a column" do
		@game_board.add_new_square(0, 0, "O")
		@game_board.add_new_square(0, 1, "X")
		@game_board.add_new_square(2, 0, "O")
		@hard_mode.make_move(@game_board, "X")
	end
	
end