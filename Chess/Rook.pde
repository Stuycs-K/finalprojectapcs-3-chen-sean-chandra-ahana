class Rook extends Piece{
  boolean castle;
  Rook(boolean isWhite, int[] startPos, Board board){
      super(isWhite, 5, startPos, board);
      castle = true;
    }

  
  void updateMoves(){ 
    possibleMoves.clear();
    int row = position[0];
    int col = position[1];  
    int[] direc = {-1, 1, 0, 0};
    int[] direc2 = {0, 0, 1, -1};
    for(int i = 0; i < 4; i++){
      int r = row + direc[i];
      int c = col + direc2[i];
      while(isWithinBounds(new int[] {r, c})){
        Piece other = board.grid[r][c];
        if(other == null){
          possibleMoves.add(new int[] {r, c});
        }
        else{
          if(other.isWhite != this.isWhite){
           possibleMoves.add(new int[] {r, c});
        }
        break; // this exits the innermost loop, in this case 
               //it stops going further in the direcection its currently going in 
        }
        r+= direc[i];
        c+= direc2[i];
      }
    }
  }
  
  boolean canCastle(){
    return castle;
  }
  boolean isLegal(int[] go){
    updateMoves();
    return contains(go);
  }
}
