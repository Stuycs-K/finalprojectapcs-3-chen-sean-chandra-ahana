class Pawn extends Piece{
    boolean firstMove;
    boolean enPassant;

    public Pawn(boolean isWhite, int[] startPos){
      super(isWhite, 1, startPosition);
      this.firstMove = false;
      enPassant = false;
    }

    public boolean isLegal(int[] targetPos){
        int direction;
        if(this.isWhite){
          direction = -1;
        }
        else{
          direction = 1; // to save space on the next if statements
        }
        if(targetPos[0] = this.position[0] + direction){
          return true;
        }
        if(firstMove && targetPos[1] == this.position[1] && target[0] == this.position[0] + 2 * direction){
          return true;
        }
        if((target[1] - current[1] == 1 || target[1] - current[1] == -1) && target[0] = this.position[0] + direction)
        {
          return true;
        }
        return false;
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
