abstract class Piece{
  boolean isWhite; 
  int value;
  ArrayList<String> legalMoves; 
  Piece(boolean isWhite, int value){
    this.isWhite = isWhite;
    this.value = value;
  }
  
  
  abstract void take();
  
  abstract void move(int r, int c); // moves to row column 
  
  abstract boolean isLegal(); // will check if the space is out of bounds, and is in legalMoves
    
}
