import java.util.ArrayList;
Board board;
int tile = 100;
Piece selectedPiece = null;
int[] selectedPos = null;
boolean whiteTurn = true;
boolean promotion = false;
boolean isWhite;
int promotionCol;  

void setup(){
  size(800,800);
  board = new Board();
  for(int i = 0; i < 8; i++){
     board.placePiece(new Pawn(true, new int[]{6, i}, board),6,i); 
     board.placePiece(new Pawn(false, new int[]{1, i}, board),1,i);
  }
  board.placePiece(new Rook(false, new int[]{0,7}, board),0,7);
  board.placePiece(new Rook(true, new int[]{7,7}, board),7,7);
  board.placePiece(new Rook(false, new int[]{0,0}, board),0,0);
  board.placePiece(new Rook(true, new int[]{7,0}, board), 7,0);
  board.placePiece(new Knight(false, new int[]{0,6}, board),0,6);
  board.placePiece(new Knight(true, new int[]{7,6}, board),7,6);
  board.placePiece(new Knight(false, new int[]{0,1}, board),0,1);
  board.placePiece(new Knight(true, new int[]{7,1}, board),7,1);
  board.placePiece(new Bishop(false, new int[]{0,5}, board),0,5);
  board.placePiece(new Bishop(true, new int[]{7,5}, board),7,5);
  board.placePiece(new Bishop(false, new int[]{0,2}, board),0,2);
  board.placePiece(new Bishop(true, new int[]{7,2}, board),7,2);
  board.placePiece(new King(true, new int[]{7,4}, board),7,4);
  board.placePiece(new King(false, new int[]{0,4}, board),0,4);
  board.placePiece(new Queen(true, new int[]{7,3}, board),7,3);
  board.placePiece(new Queen(false, new int[]{0,3}, board),0,3);
  
  
}

void draw(){
  drawBoard();
  drawPieces();
  drawSelection();
  if(promotion){
    int row;
    if(isWhite){
      row = 0;
    }
    else{
      row = 7;
    }
    Piece p = board.getPiece(row,promotionCol);
    if(p!=null){
    promote(p);
    }
  }
}
void drawBoard(){
  color c;
  for(int i = 0; i < 8; i++){
    for(int x = 0; x < 8; x++){
      if((i + x) % 2 == 0){
        c = color(255,255,255);
      }
      else{
       c = color(118, 150, 86);
      }
      
      fill(c);
      noStroke();  
      square(i*tile, x*tile,tile);
    }
  }
}
void drawPieces(){
  for(int i = 0; i < 8; i++){
    for(int x = 0; x < 8; x++){
      Piece p = board.grid[i][x];  
      if(p != null && !p.captured){
        PImage img = loadImage(p.getImageName());
        if (img != null){
          img.resize(70,70);
          image(img, x * tile+15, i * tile+15);
        } else{
          println("Missing image: " + p.getImageName());
        }
        
      }
    }
  }
}



void mouseClicked(){
  int row = mouseY / tile;
  int col = mouseX / tile;
  int z = promotionCol;
  if (row < 0 || row > 7 || col < 0 || col > 7) return;
  if(promotion){
    if(col == promotionCol){
    if(isWhite && row >= 0 && row <= 3){
      board.removePiece(0,z);
      if(row == 0){
        board.placePiece(new Queen(true, new int[]{0,z},board),0,z);
      }
      else if(row == 1){
        board.placePiece(new Rook(true, new int[]{0,z},board),0,z);
      }
      else if(row == 2){
        board.placePiece(new Bishop(true, new int[]{0,z},board),0,z);
      }
      else if(row == 3){
        board.placePiece(new Knight(true, new int[]{0,z},board),0,z);
      }
          promotion = false;
    }
    
    else if(!isWhite && row >= 4 && row <= 7){
      board.removePiece(7,z);
      if(row == 4){
        board.placePiece(new Queen(false, new int[]{7,z},board),7,z);
      }
      else if(row == 5){
        board.placePiece(new Rook(false, new int[]{7,z},board),7,z);
      }
      else if(row == 6){
        board.placePiece(new Bishop(false, new int[]{7,z},board),7,z);
      }
      else if(row == 7){
        board.placePiece(new Knight(false, new int[]{7,z},board),7,z);
      }
          promotion = false;
    }
    }
    return;
  }
  if (selectedPiece == null){
    Piece p = board.grid[row][col];
    if (p != null && !p.captured && p.isWhite == whiteTurn && !promotion){
      selectedPiece = p;
    selectedPos = new int[]{row, col};
    selectedPiece.updateMoves();
  }
} else{
int[] destination = new int[]{row, col};
if (selectedPiece.isLegal(destination)){
  selectedPiece.move(destination);
    if(selectedPiece.toString().equals("pawn")){
      if(selectedPiece.position[0] == 0 && selectedPiece.isWhite){
    isWhite = true;
        promotion = true;
        promotionCol = selectedPiece.position[1];
  }
  else if(!selectedPiece.isWhite && selectedPiece.position[0] == 7){
    isWhite = false;
    promotion = true;
    promotionCol = selectedPiece.position[1];
  }
    }
  whiteTurn = !whiteTurn;
}
selectedPiece = null;
selectedPos = null;
}
  }

void drawSelection(){
  if (selectedPiece != null){
    stroke(0, 255, 0);
    strokeWeight(4);
    noFill();
    rect(selectedPos[1] * tile, selectedPos[0] * tile, tile, tile);
    noStroke();
    fill(0, 255, 0, 100);
    for (int[] move : selectedPiece.possibleMoves){
      ellipse(move[1] * tile + tile / 2, move[0] * tile + tile / 2, tile / 4, tile / 4);
    }
  }
}

void promote(Piece pawn){
  int col = pawn.position[1];
  stroke(0);
  fill(255);
  
  if(pawn.isWhite){
    rect(col*tile, 0, tile, 4*tile);
  }
  else if(!pawn.isWhite){
    rect(col*tile, 4*tile, tile, 4*tile);
  }
  if(pawn.isWhite){
    PImage img = loadImage("queen.png");
    img.resize(70,70);
    image(img, col*tile +15, 15);
    img = loadImage("rook.png");
    img.resize(70,70);
    image(img, col*tile +15, tile + 15);
    img = loadImage("bishop.png");
    img.resize(70,70);
    image(img, col*tile +15, 2* tile + 15);
    img = loadImage("knight.png");
    img.resize(70,70);
    image(img, col*tile +15, 3 *tile + 15);
  }
  else if(!pawn.isWhite){
    PImage img = loadImage("queen1.png");
    img.resize(70,70);
    image(img, col*tile +15, 4*tile + 15);
    img = loadImage("rook1.png");
    img.resize(70,70);
    image(img, col*tile +15, 5* tile + 15);
    img = loadImage("bishop1.png");
    img.resize(70,70);
    image(img, col*tile +15, 6* tile + 15);
    img = loadImage("knight1.png");
    img.resize(70,70);
    image(img, col*tile +15, 7 *tile + 15);
  }
}
