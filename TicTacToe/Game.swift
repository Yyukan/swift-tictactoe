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
        
        println(board.description)
        do {
            if board.isMovePossible() {
                player1.move()
                println(board.description)
            } else {
                break
            }
            
            if board.isMovePossible() {
                player2.move()
                println(board.description)
            } else {
                break
            }
        } while true
        
        let winner = board.winner()
        
        if (player1.figure == winner) {
            println("Player 1 won")
        } else if (player2.figure == winner) {
            println("Player 2 won")
        } else {
            println("No winner")
        }
        
    }
}