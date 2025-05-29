import java.util.*;
class Pawn extends Piece{
    boolean firstMove;
    boolean enPassant;

    Pawn(boolean isWhite, int[] startPos){
      super(isWhite, 1, startPos);
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
        if(isWithinBounds(move) && Board[move[0]][move[1]] == null){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction*2, col};
        if(isWithinBounds(move) && firstMove && Board[move[0]][move[1]] == null && Board[move[0]-direction][col] == null){
          possibleMoves.add(move);
        }
        move = new int[] {row + direction, col + 1};
        Piece target;
        if(isWithinBounds(move)){
          target = Board[move[0]][move[1]];
          if(target != null && target.isWhite != this.isWhite){
            possibleMoves.add(move);
          }
        }
        move = new int[] {row + direction, col - 1};
        if(isWithinBounds(move)){
          target = Board[move[0]][move[1]];
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
