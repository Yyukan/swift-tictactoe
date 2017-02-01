//
//  Game.swift
//  TicTacToe
//
//  Created by Oleksandr Shtykhno on 01/02/15.
//  Copyright (c) 2015 Oleksandr Shtykhno. All rights reserved.
//

import Foundation

class Game {
    
    var board = Board()
    
    func run() {
        
        let player1 = Human(figure : Figure.CROSS, board:board)
        let player2 = Ai(figure : Figure.ZERO, board:board)
        
        print(board.description)
        repeat {
            if board.isMovePossible() {
                player1.move()
                print(board.description)
            } else {
                break
            }
            
            if board.isMovePossible() {
                player2.move()
                print(board.description)
            } else {
                break
            }
        } while true
        
        let winner = board.winner()
        
        if (player1.figure == winner) {
            print("Player 1 won")
        } else if (player2.figure == winner) {
            print("Player 2 won")
        } else {
            print("No winner")
        }
        
    }
}
