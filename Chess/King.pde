class King extends Piece{
  boolean firstMove;
  King(boolean isWhite, int[] startPosition, Board board){
    super(isWhite, 100, startPosition, board);
    possibleMoves = new ArrayList<int[]>();
    firstMove = true;
  }

  boolean isLegal(int[] go){
    return contains(go);
  }

  void updateMoves(){
    if (board == null || board.grid == null) return;
    possibleMoves.clear();

    int[][] directions = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};

    for(int[] dir : directions){
      int newRow = position[0] + dir[0];
      int newCol = position[1] + dir[1];
      int[] move = {newRow, newCol};

      if(isWithinBounds(move)){
        Piece target = board.grid[newRow][newCol];
        if(target == null || target.isWhite != this.isWhite){
          possibleMoves.add(move);
        }
      }
    }
    if(firstMove){
      int row = position[0];
      int[][] dir = {{position[0],position[1]-1},{position[0],position[1]-2},{position[0],position[1]+1},{position[0],position[1]+2}};
      for(int[] i : dir){
        Piece target = board.grid[i[0]][i[1]];
        if(target == null){
          if(i[1] < 4 && board.grid[position[0]][0].toString().equals("rook")){
                    possibleMoves.add(i);
          }
          if(i[1] >4 && board.grid[position[0]][0].toString().equals("rook")){
                    possibleMoves.add(i);
          }
        }
      }
    }
  }
  
  void castle(boolean kingSide){
    if(kingSide){
      board.move(this,position[0],6);
    }
    Piece rook = board.grid[position[0]][7];
    board.move(rook,position[0],5);
    if(rook != null && rook.toString().equals("rook")){
      rook.afterMove();
    }
    else{
      board.move(this,position[0],2);
      rook = board.grid[position[0]][0];
      board.move(rook,position[0],3);
      if(rook != null && rook.toString().equals("rook")){
        rook.afterMove();
      }
    }
    this.afterMove();
  }
  @Override
  public String toString(){
    return "king";
  }
  
  void afterMove(){
    firstMove=false;
  }
}
