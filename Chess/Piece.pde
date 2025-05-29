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
  
  
  abstract void take();
  
  void move(int[] go){
    if(isLegal(go)){
      position = go;
    }
  }  
  
  abstract boolean isLegal(int[] go);
  boolean isWithinBounds(int[] go){
    return go[0] >= 0 && go[0] < 8 && go[1] >= 0 && go[1] < 8;
  }
  
  abstract void updateMoves();
    
}
