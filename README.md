# MEMORY CARD GAME

A command-line card game where the user selects two cards attempting to match a pair. Game ends once all matches have been found, i.e. all cards are face up. Written in Ruby.

## INPUT

A card is selected by inputting x,y coordinates. If they are valid (card is currently hidden), the card will be flipped. If the input is invalid, the user is prompted to try again.

NOTE: Arrays are normally indexed as y,x (row, column). To follow traditional grid coordinate systems, the input is reversed upon receipt.

## PLAYERS

The game accepts one human player or one computer player. The computer player chooses cards at random to begin with and then stores that information. If the computer is aware of a match, the computer will choose the matching pair.