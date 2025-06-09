class Pawn extends Piece{
    boolean firstMove;
    boolean enPassant;
    boolean canPromote;

    Pawn(boolean isWhite, int[] startPos, Board board){
      super(isWhite, 1, startPos, board);
      this.firstMove = true;
      enPassant = false;
      possibleMoves = new ArrayList<int[]>();
      canPromote = false;
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
        if(col+1<8){
         move = new int[] {row + direction, col + 1};
        if(isWithinBounds(move)){
          Piece target = board.grid[move[0]][move[1]];
          if(target != null && target.isWhite != this.isWhite){
            possibleMoves.add(move);
          }
          else{
            Piece side = board.grid[row][col+1];
            if(side != null && side.toString().equals("pawn")){
            if(side == board.lastPawn && side.enPassant && side.isWhite != this.isWhite){
              possibleMoves.add(move);
            }
            }
          }
        }
        }
        if(col-1 >= 0){
        move = new int[] {row + direction, col - 1};
        if(isWithinBounds(move)){
          Piece target = board.grid[move[0]][move[1]];
          if(target != null && target.isWhite != this.isWhite){
            possibleMoves.add(move);
          } 
          else{
            Piece side = board.grid[row][col-1];
            if(side != null && side.toString().equals("pawn")){
              if(side == board.lastPawn && side.enPassant && side.isWhite != this.isWhite){
                possibleMoves.add(move);
              }
            }
          }
        }
        }
  }

    void move(int[] target){
      int targetRow = target[0];
      int targetCol = target[1];
        if (isLegal(target)){
            if (Math.abs(targetRow - position[0]) == 2){
                this.enPassant = true;
                board.lastPawn = this;
            } else{
                this.enPassant = false;
            }
            if(Math.abs(targetCol - position[1]) == 1 && board.grid[targetRow][targetCol] == null){
              Piece tarPawn = board.grid[position[0]][targetCol];
              if(tarPawn != null && tarPawn.toString().equals("pawn")){
                if(tarPawn == board.lastPawn && tarPawn.enPassant){
                  board.grid[position[0]][targetCol] = null;
                  tarPawn.captured = true;
                }
              }
            }
            board.grid[targetRow][targetCol] = this;
            board.grid[position[0]][position[1]] = null;
            position[0] = targetRow;
            position[1] = targetCol;
            firstMove = false;
        }
        if(isWhite && targetRow == 0){
          promotion = true;
          promotionPiece = this;
          promotionCol = targetCol;
          isWhite=true;
        }
        if(!isWhite && targetRow == 7){
          promotion = true;
          promotionPiece = this;
          promotionCol = targetCol;
          isWhite=false;
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
    @Override
    public String toString(){
      return "pawn";
    }
    @Override
    void afterMove(){
      firstMove = false;
    }
    void reachEnd(){
      canPromote = true;
    }
}
