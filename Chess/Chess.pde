Board board;
PImage boardImage;
int tile = 100;

void setup(){
  size(1920,1080);
  board = new Board();
  boardImage = loadImage("chessboard.png");
  for(int i = 0; i < 8; i++){
     board.placePiece(new Pawn(true, new int[]{i, 6}),i,6); 
     board.placePiece(new Pawn(false, new int[]{i, 1}),i,1);
  }
  board.placePiece(new Rook(false, new int[]{0,7},0,7));
  board.placePiece(new Rook(true, new int[]{7,7},7,7));
  board.placePiece(new Rook(false, new int[]{0,0},0,0));
  board.placePiece(new Rook(true, new int[]{7,0},0,7));
  board.placePiece(new Knight(false, new int[]{0,6}),0,6);
  board.placePiece(new Knight(true, new int[]{7,6}),7,6);
  board.placePiece(new Knight(false, new int[]{0,1}),0,1);
  board.placePiece(new Knight(true, new int[]{7,1}),7,1);
  board.placePiece(new Bishop(false, new int[]{0,5}),0,5);
  board.placePiece(new Bishop(true, new int[]{7,5}),7,5);
  board.placePiece(new Bishop(false, new int[]{0,2}),0,2);
  board.placePiece(new Bishop(true, new int[]{7,2}),7,2);
  board.placePiece(new King(true, new int[]{7,4}),7,4);
  board.placePiece(new King(false, new int[]{0,4}),0,4);
  board.placePiece(new Queen(true, new int[]{7,4}),7,4);
  board.placePiece(new Queen(false, new int[]{0,4}),0,4);
  
  
}

void draw(){
  background(255);
  drawPieces();
  drawSide();
}

void drawPieces(){
  for(int i = 0; i < 8; i++){
    for(int x = 0; x < 8; x++){
      Piece p = board.Board[i][x];  
      if(p != null && !p.captured){
        PImage img = loadImage(p.lower()
      }
    }
  }
  }
}


void mouseClicked(){
  
}
