import java.util.*;
class Pawn extends Piece{
    boolean firstMove;
    boolean enPassant;

    Pawn(boolean isWhite, int[] startPos){
      super(isWhite, 1, startPos);
      this.firstMove = false;
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

    void move(int[] target){
      int targetRow = target[0];
      int targetCol = target[1];
        if (isLegal(target)){
            if (Math.abs(targetRow - position[0]) == 2){
                this.enPassant = true;
            } else{
                this.enPassant = false;
            }
            Board[targetRow][targetCol] = this;
            Board[position[0]][position[1]] = null;
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
}
