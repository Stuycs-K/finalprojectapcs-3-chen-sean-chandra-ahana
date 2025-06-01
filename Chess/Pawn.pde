class Pawn extends Piece{
    boolean firstMove;
    boolean enPassant;

    Pawn(boolean isWhite, int[] startPos, Board board){
      super(isWhite, 1, startPos, board);
      this.firstMove = true;
      enPassant = false;
    }

  
  void updateMoves(){
    possibleMoves.clear();
    int direction;
    if(isWhite){
      direction = -1;
    }
    else{
      direction = 1;
    }
        int row = position[0];
        int col = position[1];
        
        int[] move = new int[] {row + direction, col};
        if (isWithinBounds(move) && board.grid[move[0]][move[1]] == null){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction*2, col};
        if (isWithinBounds(move) && firstMove && 
        board.grid[move[0]][move[1]] == null && 
        board.grid[move[0] - direction][col] == null){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction, col + 1};
        if(isWithinBounds(move)){
          Piece target = board.grid[move[0]][move[1]];
          if(target != null && target.isWhite != this.isWhite){
            possibleMoves.add(move);
          }
        }
        move = new int[] {row + direction, col - 1};
        if(isWithinBounds(move)){
          Piece target = board.grid[move[0]][move[1]];
          if(target != null && target.isWhite != this.isWhite){
            possibleMoves.add(move);
          }
        }        
  }

    void move(int[] target){
      int targetRow = target[0];
      int targetCol = target[1];
        if (isLegal(target)){
            if (Math.abs(targetRow - position[0]) == 2){
                this.enPassant = true;
            } else{
                this.enPassant = false;
            }
            board.grid[targetRow][targetCol] = this;
            board.grid[position[0]][position[1]] = null;
            position[0] = targetRow;
            position[1] = targetCol;
            firstMove = false;
        }
    }


     boolean isFirstMove(){
        return firstMove;
    }

     boolean canEnPassant(){
        return enPassant;
    }
    boolean isLegal(int[] go){
      updateMoves();
      return contains(go);
    }
    
}
