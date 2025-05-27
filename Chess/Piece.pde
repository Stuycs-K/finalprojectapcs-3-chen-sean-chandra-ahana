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
  boolean isWithinBounds(){
    return position[0] >= 0 && position[0] < 8 && position[1] >= 0 && position[1] < 8;
  }
    
}
