abstract class Piece{
  boolean isWhite; 
  int value;
  boolean captured;
  ArrayList<int[]> possibleMoves; 
  Piece(boolean isWhite, int value){
    this.isWhite = isWhite;
    this.value = value;
    captured = false;
  }
  
  
  abstract void take();
  
  void move(int[] go){
    if(isLegal(go)){
      
    }
  }  
  
  abstract boolean isLegal(int[] go);
  
    
}
