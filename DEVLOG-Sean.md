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
