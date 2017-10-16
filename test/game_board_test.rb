require_relative '../game_board'
	
describe "GameBoard" do
	before(:each) do
		@game_board = GameBoard.new
	end

	it "will return false for game win" do
		expect(@game_board.is_game_over?).to be false
	end

	it "will return true when there are three X's in a column" do
		@game_board.add_new_square(0, 0, "X")
		@game_board.add_new_square(0, 1, "X")
		@game_board.add_new_square(0, 2, "X")
		expect(@game_board.is_game_over?("X")).to be true
	end

	it "will return true when there are three X's in a row" do
		@game_board.add_new_square(0, 0, "X")
		@game_board.add_new_square(1, 0, "X")
		@game_board.add_new_square(2, 0, "X")
		expect(@game_board.is_game_over?("X")).to be true
	end

	it "will return true when there are three X's in a diagonal" do
		@game_board.add_new_square(0, 0, "X")
		@game_board.add_new_square(1, 1, "X")
		@game_board.add_new_square(2, 2, "X")
		expect(@game_board.is_game_over?("X")).to be true
	end





	it "will return true when there are three O's in a column" do
		@game_board.add_new_square(0, 0, "O")
		@game_board.add_new_square(0, 1, "O")
		@game_board.add_new_square(0, 2, "O")
		expect(@game_board.is_game_over?("O")).to be true
	end

	it "will return true when there are three O's in a row" do
		@game_board.add_new_square(0, 0, "O")
		@game_board.add_new_square(1, 0, "O")
		@game_board.add_new_square(2, 0, "O")
		expect(@game_board.is_game_over?("O")).to be true
	end

	it "will return true when there are three O's in a diagonal" do
		@game_board.add_new_square(0, 0, "O")
		@game_board.add_new_square(1, 1, "O")
		@game_board.add_new_square(2, 2, "O")
		expect(@game_board.is_game_over?("O")).to be true
	end




	it "will return false when there are only two O's in a row" do
		@game_board.add_new_square(0, 0, "O")
		@game_board.add_new_square(0, 1, "O")
		expect(@game_board.is_game_over?).to be false
	end

	it "will do return true if there is a draw" do
		@game_board.add_new_square(0, 0, "O")
		@game_board.add_new_square(0, 1, "O")
		@game_board.add_new_square(0, 1, "X")

		@game_board.add_new_square(0, 1, "X")
		@game_board.add_new_square(0, 1, "X")
		@game_board.add_new_square(0, 1, "O")

		@game_board.add_new_square(0, 1, "O")
		@game_board.add_new_square(0, 1, "X")
		@game_board.add_new_square(0, 1, "X")

		expect(@game_board.is_game_a_draw?).to be false
	end
end