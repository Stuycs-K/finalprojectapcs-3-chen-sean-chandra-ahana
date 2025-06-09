# Dev Log:

This document must be updated daily every time you finish a work session.

## Sean Chen

### 2025-05-22 - Brief description :Started classes, made a few edits to prototype

Expanded description:
- did everything in prototype (revamped to put more detail in order to be more in line with class website)
- still waiting on partner to join repo and commit something
- wrote abstract class Piece
- created new tabs, started writing subclasses Rook, Bishop, Queen


### 2025-05-23 - improving Piece, writing new classes
- added some new stuff to prototype
- wrote Piece class, waiting on partner to write Board class to implement last method
- wrote Pawn, didn't finish implementing all methods


### 2025-05-27 - wrote most of Pawn
- a little behind on schedule, writing Pawn took a lot of time to flesh out and plus I had to go back to edit Piece in places it was missing
- edited prototype, i realize we need a better UML diagram
- helped partner with branch stuff

### 2025-05-28 - finished all of pawn, leaving promote to chess or will implement in future, finished queen
- moved take() to main, considering moving move to main and having special pieces override
- implemented movement that takes into account where pieces stop moving (ex blocked by piece, blocked by enemy piece that is takeable)
- still need to update uml diagrams and prototype
- finished queen class mostly, fixed firstmove being false in pawn after I saw some things were off when I was editing take and move
- rewrote move, now sets place on board to null and moves to target place if isLegal() is true


### 2025-05-29 - finished all other classes I need, working on chess setup
- wrote Rook
- wrote Bishop
- fixed a few things in Piece and Queen again (board class uploaded, went back to fix errors)
- updated prototype

### 2025-05-30 - set up board, found sprites, draw board + pieces
- wrote board setup, including pieces
- found some really nice pixel sprites, hope they don't bug out when we try to expand them a little to fit board
- started mouseClicked
- need to update diagram for Chess class

### 2025-06-02 - overall fixes 
- made board for chess
- working with partner to fix correct updatePieces (miscommunication lead to misuse of methods)
- updated prototype more
- resized pieces and displayed them

### 2025-06-03 - more overall fixes and progress
- started working on mouseClicked()
- fixed some out of bounds and null pointer errors while trying to move pieces
- starting to write promotion

### 2025-06-04 - continued to write promotion, very buggy for some reason with end case pawns
- some pawns are bugged, need to fix 
- rectangle doesn't display correctly upon promotion

### 2025-06-05 - working on new methods and fixing old methods
- writing promotion, and it was a little bugged still but everything works as intended (shows pieces, promotes pieces) except the two pawns
- started castle, was a little bugged
- need to continue working on it further, later
- updated Chess class, fixed broken pawns

### 2025-06-06 - fixed promotion, trying to fix castle
- fixed castle doing some null pointer shenanigans, still doesn't move rook???
- first white pawn no longer flickers promotion screen and randomly promote the white rook

### 2025-06-08 - fixed promotion again, wrote custom boards, castle updating
- tried to fix castle but let partner do it because I couldn't figure out what was wrong 
- promotion had a weird bug where the 8th pawn was randomly promoting the white rook in the same column, fixed the error (indexing error)
- wrote custom boards 
- fixed up a few methods in other classes that crashed with null pointer errors when I made custom boards
- wrote enPassant

I believe this document accurately reflects the contributions of my teammate.