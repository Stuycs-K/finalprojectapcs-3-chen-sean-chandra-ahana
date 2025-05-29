import java.util.*;
abstract class Piece{
  boolean isWhite; 
  int value;
  boolean captured;
  int[] position;
  ArrayList<int[]> possibleMoves; 
  Piece(boolean isWhite, int value, int[] startPosition){
    this.isWhite = isWhite;
    this.value = value;
    captured = false;
    this.position = startPosition;
  }
  
  
  void take(int[] go){
    if(Board[go[0]][go[1]] != null && !target.captured){
      Board[go[0]][go[1]].captured = true;
      Board[position[0]][position[1]]= null;
      this.position = go;
      Board[go[0]][go[1]].position = this;
      //also needs to update points
      
    }
  }
  
  void move(int[] go){
    if(isLegal(go)){
      position = go;
    }
  }  
  
  abstract boolean isLegal(int[] go){
    contains(go);
  }
  
  boolean isWithinBounds(int[] go){
    return go[0] >= 0 && go[0] < 8 && go[1] >= 0 && go[1] < 8;
  }
  
  abstract void updateMoves();
   boolean contains(int[] go){
     for(int[] x : possibleMoves){
       if(x[0] == go[0] && x[1] == go[1]){
         return true;
       }
     }
     return false;
   }
}
