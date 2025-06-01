class Knight extends Piece{

  Knight(boolean isWhite, int value, int[] startPosition, Board board){
    super(isWhite, value, startPosition, board);
    possibleMoves = new ArrayList<int[]>();
  }

  boolean isLegal(int[] go){
    return contains(go);
  }

  void updateMoves(){
    possibleMoves.clear();

    int[][] directions = {{2, 1}, {2, -1}, {-2, 1}, {-2, -1}, {1, 2}, {1, -2}, {-1, 2}, {-1, -2}};

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
