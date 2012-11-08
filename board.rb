class Board
  require 'piece'

  attr_reader :white_captures, :black_captures
  def initialize
    @board = []
    8.times.each do
      row = []
      8.times.each do
        row.push nil
      end
      @board.push row
    end
    init_black
    init_white

    @white_captures = []
    @black_captures = []
  end

  def init_black
    @board[0][0] = Piece.rook(Piece::BLACK)
    @board[0][1] = Piece.knight(Piece::BLACK)
    @board[0][2] = Piece.bishop(Piece::BLACK)
    @board[0][3] = Piece.queen(Piece::BLACK)
    @board[0][4] = Piece.king(Piece::BLACK)
    @board[0][5] = Piece.bishop(Piece::BLACK)
    @board[0][6] = Piece.knight(Piece::BLACK)
    @board[0][7] = Piece.rook(Piece::BLACK)

    8.times do |col|
      @board[1][col] = Piece.pawn(Piece::BLACK)
    end
  end

  def init_white
    @board[7][0] = Piece.rook(Piece::BLACK)
    @board[7][1] = Piece.knight(Piece::BLACK)
    @board[7][2] = Piece.bishop(Piece::BLACK)
    @board[7][3] = Piece.queen(Piece::BLACK)
    @board[7][4] = Piece.king(Piece::BLACK)
    @board[7][5] = Piece.bishop(Piece::BLACK)
    @board[7][6] = Piece.knight(Piece::BLACK)
    @board[7][7] = Piece.rook(Piece::BLACK)

    8.times do |col|
      @board[6][col] = Piece.pawn(Piece::BLACK)
    end
  end

  def can_move?(curr_position, dest_position, piece)
    return false if out_of_bounds?(dest_position)

    if piece.type == Piece::PAWN
      if piece.color == Piece::BLACK
        return curr_position[1] == dest_position[1] \
          && curr_position[0] == (dest_position[0] - 1)
      else
        return curr_position[1] == dest_position[1] \
          && curr_position[0] == (dest_position[0] + 1)
      end
    end

  end

  def move(curr_position, dest_position, piece)
    return unless can_move?(curr_position, dest_position, piece)

    if dest_position.nil?
      @board[curr_position[0]][curr_position[1]] = nil
    else
      capture piece, @board[dest_position[0]][dest_position[1]]
    end

    @board[dest_position[0]][dest_position[1]] = piece
  end

  def capture(conqueror, conquest)
    @white_captures.push conquest if conqueror.white?
    @black_captures.push conquest if conqueror.black?
  end

  def out_of_bounds?(dest_position)
    dest_position[0] < 0 || dest_position[0] > 7 || dest_position[1] < 0 || dest_position[1] > 7
  end

  def inspect
    str = ""
    @board.each do |row|
      ranks = ""
      row.each do |col|
        ranks += " #{col.inspect} "
      end
      str += "#{ranks}\n"
    end

    str
  end
end
