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
      while(isWithinBounds(new int[] {row + dir[i], col + dir2[i]})){
        if(
        possibleMoves.add(new int[] {row + dir[i], col + dir2[i]});
      }
    }
  }
}
