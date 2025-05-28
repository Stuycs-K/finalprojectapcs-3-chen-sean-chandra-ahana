class Knight extends Piece{
  private int row;
  private int col;
  private int value;
  private boolean captured;
    Knight(int row, int col, int value){
        this.row = row;
        this.col = col;
        this.value = value;
        this.captured = false;
    }

    boolean isLegal(int targetRow, int targetCol){
        int dx = Math.abs(targetRow - row);
        int dy = Math.abs(targetCol - col);
        return (dx == 2 && dy == 1) || (dx == 1 && dy == 2);
    }

    void move(int targetRow, int targetCol){
        if (isLegal(targetRow, targetCol)){
            this.row = targetRow;
            this.col = targetCol;
        }
    }

    void take(Piece target){
        if (isLegal(target.row, target.col) && !target.captured){
            target.captured = true;
            move(target.row, target.col);
        }
    }
}
