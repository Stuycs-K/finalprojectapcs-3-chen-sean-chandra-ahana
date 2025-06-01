class King extends Piece{

  King(boolean isWhite, int value, int[] startPosition, Board board){
    super(isWhite, value, startPosition, board);
    possibleMoves = new ArrayList<int[]>();
  }

  boolean isLegal(int[] go){
    return contains(go);
  }

  void updateMoves(){
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
  }
}
