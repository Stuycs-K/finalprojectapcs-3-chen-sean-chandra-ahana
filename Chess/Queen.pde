class Queen extends Piece{
  Queen(boolean isWhite, int[] startPos){
      super(isWhite, 1, startPos);
    }

    boolean isLegal(int[] targetPos){
      return possibleMoves.contains(targetPos);
  }
  
  void updateMoves(){
    int row = position[0];
    int col = position[1];
    int[] dir = {1,-1,1-1};
    int[] dir2 = {1,1,-1,-1};
    for(int i = 0; i < 4; i++){
      int r = row + dir[i];
      int c = row + dir2[i];
      while(isWithinBounds(new int[] {r, c})){
        //Piece other = board[r][c]; need partner to write board class
        if(other == null){
          possibleMoves.add(new int[] {r, c});
        }
        else{
          if(other.isWhite != this.isWhite){
           possibleMoves.add(new int[] {r, c});
        }
        break; // this exits the innermost loop, in this case 
               //it stops going further in the direction its currently going in 
        }
        r+= dir[i];
        c+= dir2[i];
      }
    }
  }
}
