class Pawn extends Piece{
    boolean firstMove;
    boolean enPassant;

    public Pawn(boolean isWhite, int[] startPos){
      super(isWhite, 1, startPosition);
      this.firstMove = false;
      enPassant = false;
    }

    public boolean isLegal(int[] targetPos){
      return possibleMoves.contains(targetPos);
  }
  
  public void updateMoves(){
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
        if(isWithinBounds(move)){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction*2, col};
        if(isWithinBounds(move) && firstMove){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction*2, col};
        if(isWithinBounds(move)){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction, col + 1};
        if(isWithinBounds(move)){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction, col - 1};
        if(isWithinBounds(move)){
          possibleMoves.add(move);
        }        
  }

    public void move(int targetRow, int targetCol){
        if (isLegal(targetRow, targetCol)){
            if (Math.abs(targetRow - this.row) == 2){
                this.enPassant = true;
            } else{
                this.enPassant = false;
            }

            this.row = targetRow;
            this.col = targetCol;
            this.firstMove = false;
        }
    }

    public void take(Piece target){
        int direction;
        if (this.value > 0){
            direction = -1;
        } else{
            direction = 1;
        }

        if (!target.captured){
            if (Math.abs(target.col - this.col) == 1 && target.row == this.row + direction){
                target.captured = true;
                move(target.row, target.col);
            }
        }

    }

    public boolean isFirstMove(){
        return firstMove;
    }

    public boolean canEnPassant(){
        return enPassant;
    }
}
