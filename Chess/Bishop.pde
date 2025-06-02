class Bishop extends Piece{
  Bishop(boolean isWhite, int[] startPos, Board board){
      super(isWhite, 3, startPos, board);
    }

  
  void updateMoves(){ 
    possibleMoves.clear();
    int row = position[0];
    int col = position[1];
    int[] direc = {1,-1,1,-1};
    int[] direc2 = {1,1,-1,-1};
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
        break; 
        }
        r+= direc[i];
        c+= direc2[i];
      }
    }
  }
  boolean isLegal(int[] go){
    updateMoves();
    return contains(go);
  }
  @Override
  public String toString(){
    return "bishop";
  }
}
