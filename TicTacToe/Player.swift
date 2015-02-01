//
//  Player.swift
//  TicTacToe
//
//  Created by Oleksandr Shtykhno on 01/02/15.
//  Copyright (c) 2015 Oleksandr Shtykhno. All rights reserved.
//

import Foundation

protocol Player {
    var figure: Figure { get }
    func move()
}

class AbstractPlayer : Player {
    var board : Board
    var figure : Figure
    
    init(figure: Figure, board: Board) {
        self.figure = figure
        self.board = board
    }
    
    func move() {
        func input() -> NSString? {
            println("Input index of figure \(self.figure.description):")
            return NSString(data:NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding)
        }

        var index : String = input()!
        board.set(dropLast(index).toInt()!, figure: self.figure)
    }
}

class Human : AbstractPlayer {
    override func move() {
        super.move()
    }
}


class Ai : AbstractPlayer {
    override func move() {
        super.move()
        // here must be minimax
        
    }
}