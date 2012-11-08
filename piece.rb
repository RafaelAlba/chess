class Piece
  WHITE = "white"
  BLACK = "black"
  PAWN = 'pawn'

  attr_reader :color, :type, :movement

  def initialize(color, type, movement)
    @color = color
    @type = type
    @movement = movement
  end

  def white?
    @color == WHITE
  end

  def black?
    @color == BLACK
  end

  def inspect
    @type
  end

  def ==( other )
    if other.respond_to?( :type ) && other.respond_to?( :color )
      self.type == other.type && self.color == other.color
    end
  end

  class << self
    def pawn(color)
      Piece.new(color, PAWN, 1)
    end
    def knight(color)
      Piece.new(color, 'knight', 1)
    end
    def queen(color)
      Piece.new(color, 'queen', 1)
    end
    def bishop(color)
      Piece.new(color, 'bishop', 1)
    end
    def rook(color)
      Piece.new(color, 'rook', 1)
    end
    def king(color)
      Piece.new(color, 'king', 1)
    end
  end

end
