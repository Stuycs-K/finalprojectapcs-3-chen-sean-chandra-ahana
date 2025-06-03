abstract class Piece{
  boolean isWhite; 
  int value;
  boolean captured;
  int[] position;
  ArrayList<int[]> possibleMoves;
  Board board;
  Piece(boolean isWhite, int value, int[] startPosition, Board board){
    this.isWhite = isWhite;
    this.value = value;
    this.board = board;
    captured = false;
    this.position = startPosition;
  }
  
  
  void take(int[] go){
    Piece target = board.grid[go[0]][go[1]];
    if (target != null && !target.captured){
      target.captured = true;
      board.grid[position[0]][position[1]] = null;
      this.position = go;
      board.grid[go[0]][go[1]] = this;
    }
  }
  
  void move(int[] go){
    if(isLegal(go)){
      board.grid[go[0]][go[1]] = this;
      board.grid[position[0]][position[1]] = null;
      position = go;
    }
  }  
  
  abstract boolean isLegal(int[] go);
  
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
   String getImageName(){
     String name = this.toString();
     if (!isWhite){
       name += "1";
     }
     name += ".png";
     return name;
   }
   void afterMove(){
   }
}
