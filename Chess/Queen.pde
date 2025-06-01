class Queen extends Piece{
  Queen(boolean isWhite, int[] startPos, Board board){
      super(isWhite, 9, startPos, board);
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
        break; // this exits the innermost loop, in this case 
               //it stops going further in the direcection its currently going in 
        }
        r+= direc[i];
        c+= direc2[i];
      }
    }
    direc = new int[]{-1,1,0,0};
    direc2 = new int[]{0,0,1,-1};
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
  
  void move(int[] target){
        if (isLegal(target)){
            board.grid[position[0]][position[1]] = null;
            position[0] = target[0];
            position[1] = target[1];
            board.grid[target[0]][target[1]] = this;
        }
   }
   boolean isLegal(int[] go){
    updateMoves();
    return contains(go);
  }
  
}
