class Pawn extends Piece{
    boolean firstMove;
    boolean enPassant;

    public Pawn(int value){
        this.value = value;
        this.captured = false;
        this.firstMove = true;
        this.enPassant = false;
    }

    public boolean isLegal(int targetRow, int targetCol){
        int direction;
        if (this.value > 0){
            direction = -1;
        } else{
            direction = 1;
        }

        if (targetCol == this.col && targetRow == this.row + direction){
            return true;
        }

        if (firstMove && targetCol == this.col && targetRow == this.row + 2 * direction){
            return true;
        }

        if (Math.abs(targetCol - this.col) == 1 && targetRow == this.row + direction){
            return true;
        }

        return false;
    }

    public void move(int targetRow, int targetCol){
        if (isLegal(targetRow, targetCol)){
            if (Math.abs(targetRow - this.row) == 2){
                this.enPassant = true;
            } else{
                this.enPassant = false;
            }

            this.row = targetRow;
            this.col = targetCol;
            this.firstMove = false;
        }
    }

    public void take(Piece target){
        int direction;
        if (this.value > 0){
            direction = -1;
        } else{
            direction = 1;
        }

        if (!target.captured){
            if (Math.abs(target.col - this.col) == 1 && target.row == this.row + direction){
                target.captured = true;
                move(target.row, target.col);
            }
        }

    }

    public boolean isFirstMove(){
        return firstMove;
    }

    public boolean canEnPassant(){
        return enPassant;
    }
}
