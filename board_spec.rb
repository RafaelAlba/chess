require 'board'

describe Board do
  describe "brand new game" do
    before do
      @board = Board.new
    end

    it "creates the starting board" do
      @board.white_captures.should eq([])
      @board.black_captures.should eq([])
      @board.inspect.should ==
" rook  knight  bishop  queen  king  bishop  knight  rook 
 pawn  pawn  pawn  pawn  pawn  pawn  pawn  pawn 
 nil  nil  nil  nil  nil  nil  nil  nil 
 nil  nil  nil  nil  nil  nil  nil  nil 
 nil  nil  nil  nil  nil  nil  nil  nil 
 nil  nil  nil  nil  nil  nil  nil  nil 
 pawn  pawn  pawn  pawn  pawn  pawn  pawn  pawn 
 rook  knight  bishop  queen  king  bishop  knight  rook \n"
    end

    describe "black pawn moves" do
      it "can move down by one" do
        @board.can_move?([1,0], [2,0], Piece.pawn(Piece::BLACK)).should be_true
      end

      it "cannot move up by one" do
        @board.can_move?([2,0], [1,0], Piece.pawn(Piece::BLACK)).should be_false
      end

      it "cannot move down by two" do
        @board.can_move?([1,0], [3,0], Piece.pawn(Piece::BLACK)).should be_false
      end

      it "cannot move down below the last row" do
        @board.can_move?([7,0], [8,0], Piece.pawn(Piece::BLACK)).should be_false
      end
    end

    describe "white pawn moves" do
      it "can move up by one" do
        @board.can_move?([6,0], [5,0], Piece.pawn(Piece::WHITE)).should be_true
      end

      it "cannot down by one" do
        @board.can_move?([5,0], [6,0], Piece.pawn(Piece::WHITE)).should be_false
      end

      it "cannot move up by two" do
        @board.can_move?([6,0], [4,0], Piece.pawn(Piece::WHITE)).should be_false
      end

      it "cannot move up above the first row" do
        @board.can_move?([0,0], [-1,0], Piece.pawn(Piece::WHITE)).should be_false
      end
    end

    describe "pawn captures" do
      it "should capture for black color" do
        @board.capture Piece.pawn(Piece::BLACK), Piece.pawn(Piece::WHITE)
        @board.black_captures.should == [Piece.pawn(Piece::WHITE)]
        @board.white_captures.should == []
      end

      it "should capture for white color" do
        @board.capture Piece.pawn(Piece::WHITE), Piece.pawn(Piece::BLACK)
        @board.black_captures.should == []
        @board.white_captures.should == [Piece.pawn(Piece::BLACK)]
      end
    end
  end

end

