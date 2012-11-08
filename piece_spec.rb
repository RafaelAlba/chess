require 'piece'

describe Piece do

  describe "Pawn" do
    it "creates a valid pawn" do
      p = Piece.pawn(Piece::WHITE)
      p.color.should eq('white')
      p.type.should eq('pawn')
      p.movement.should eq(1)
    end
  end

  describe "Knight" do
    it "creates a valid knight" do
      p = Piece.knight(Piece::BLACK)
      p.color.should eq('black')
      p.type.should eq('knight')
      p.movement.should eq(1)
    end
  end

  describe "Queen" do
    it "creates a valid queen" do
      p = Piece.queen(Piece::BLACK)
      p.color.should eq('black')
      p.type.should eq('queen')
      p.movement.should eq(1)
    end
  end

  describe "Bishop" do
    it "creates a valid bishop" do
      p = Piece.bishop(Piece::BLACK)
      p.color.should eq('black')
      p.type.should eq('bishop')
      p.movement.should eq(1)
    end
  end

  describe "Rook" do
    it "creates a valid rook" do
      p = Piece.rook(Piece::BLACK)
      p.color.should eq('black')
      p.type.should eq('rook')
      p.movement.should eq(1)
    end
  end

  describe "King" do
    it "creates a valid king" do
      p = Piece.king(Piece::BLACK)
      p.color.should eq('black')
      p.type.should eq('king')
      p.movement.should eq(1)
    end
  end

end
