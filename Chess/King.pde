  class King extends Piece{
    boolean firstMove;
    King(boolean isWhite, int[] startPosition, Board board){
      super(isWhite, 100, startPosition, board);
      possibleMoves = new ArrayList<int[]>();
      firstMove = true;
    }
  
    boolean isLegal(int[] go){
      updateMoves();
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
        if(board.grid[row][5] == null && board.grid[row][6] == null){
          Piece rook = board.grid[row][7];
        if(rook != null && rook.toString().equals("rook")){
          possibleMoves.add(new int[] {row,6});
        }
        }
        if(board.grid[row][1] == null && board.grid[row][2] == null && board.grid[row][3] == null){
          Piece rook = board.grid[row][0];
          if(rook != null && rook.toString().equals("rook")){
            possibleMoves.add(new int[]{row,2});
          }
        }
      }
    }
    
    void castle(boolean kingSide){
      int row = position[0];
      if(!firstMove) return;
      if(kingSide){
       Piece rook = board.grid[row][7];
      if(rook != null && rook.toString().equals("rook") && rook.isWhite == this.isWhite){
        board.grid[row][6] = this;
        board.grid[row][4] = null;
      this.position = new int[]{row,6};
            board.grid[row][5] = rook;
      board.grid[row][7] = null;
      rook.position = new int[]{row,5};
      rook.afterMove();
      }
      }
      else{
        Piece rook = board.grid[row][0];
        if(rook != null && rook.toString().equals("rook") && rook.isWhite == this.isWhite){
           board.grid[row][2] = this;
          board.grid[row][4] = null;
      this.position = new int[]{row,2};
            board.grid[row][3] = rook;
      board.grid[row][0] = null;
      rook.position = new int[]{row,3};
      rook.afterMove();
      rook.updateMoves();
        }
      }
      this.afterMove();
      updateMoves();
    }
    @Override
    public String toString(){
      return "king";
    }
    
    void afterMove(){
      firstMove=false;
    }
  }
