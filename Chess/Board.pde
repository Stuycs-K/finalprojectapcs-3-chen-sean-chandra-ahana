class Board {
  Piece[][] grid = new Piece[8][8];
  Board() {
    for (int row = 0; row < 8; row++) {
      for (int col = 0; col < 8; col++) {
        grid[row][col] = null;
      }
    }
  }
  void placePiece(Piece piece, int row, int col) {
    if (row >= 0 && row < 8 && col >= 0 && col < 8) {
      grid[row][col] = piece;
      piece.position = new int[]{col, row};
    }
  }
  Piece getPiece(int row, int col) {
    if (row >= 0 && row < 8 && col >= 0 && col < 8) {
      return grid[row][col];
    }
    return null;
  }
  void removePiece(int row, int col) {
    if (row >= 0 && row < 8 && col >= 0 && col < 8) {
      grid[row][col] = null;
    }
  }
}
