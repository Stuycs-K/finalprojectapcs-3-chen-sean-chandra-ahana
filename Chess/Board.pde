class Board {
  Piece[][] grid = new Piece[8][8];
  Board(){
    for (int row = 0; row < 8; row++){
      for (int col = 0; col < 8; col++){
        grid[row][col] = null;
      }
    }
  }
  void placePiece(Piece piece, int row, int col){
    if (row >= 0 && row < 8 && col >= 0 && col < 8){
      grid[row][col] = piece;
      piece.position = new int[]{row, col};
    }
  }
  Piece getPiece(int row, int col){
    if (row >= 0 && row < 8 && col >= 0 && col < 8){
      return grid[row][col];
    }
    return null;
  }
  void removePiece(int row, int col){
    if (row >= 0 && row < 8 && col >= 0 && col < 8){
      grid[row][col] = null;
    }
  }
  
  void move(Piece piece,int newRow,int newCol){
    if (piece.toString.equals("pawn")){
      piece.move(new int[] {newRow, newCol});
    }
  int oldRow=piece.position[0];
  int oldCol=piece.position[1];

  if(grid[newRow][newCol]!=null){
    grid[newRow][newCol].captured=true;
  }

  grid[newRow][newCol]=piece;
  grid[oldRow][oldCol]=null;

  piece.position=new int[]{newRow,newCol};
  piece.updateMoves();
  piece.afterMove();
}
}
