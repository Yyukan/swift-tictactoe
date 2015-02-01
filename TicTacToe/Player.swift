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
    
    var choice : Int = -1
    
    var minimaxCall : Int = 0
    var scoreCall : Int = 0
    
    func score(board: Board) -> Int {
        
        scoreCall++
        
        let winner = board.winner()
        if winner == nil {
            return 0
        } else if winner == figure {
            return 10
        } else {
            return -10
        }
    }
    
    func minimax(board: Board, player: Figure) -> Int {
        minimaxCall++
        
        // no more movements - terminal state
        if !board.isMovePossible() {
            return score(board)
        }
    
        var scores : Array<Int> = []
        var moves : Array<Int> = []

        var a = board.availableMoves()
        for move in a
        {
            var next = board.copy()
            next.set(move, figure: player)

            //println(a)
            //println(next.description)
            
            scores.append(minimax(next, player : (player == Figure.ZERO ? Figure.CROSS : Figure.ZERO)))
            moves.append(move)
        }
        
        if self.figure == player {
            let max_score_index = max(scores)
            choice = moves[max_score_index]
            return scores[max_score_index]
        }
        else
        {
            let min_score_index = min(scores)
            choice = moves[min_score_index]
            return scores[min_score_index]
        }
    }
    
    func min(array: Array<Int>) -> Int {
        var min = array[0]
        var result = 0
        for index in 1..<array.count {
            if (array[index] < min) {
                result = index;
                min = array[index]
            }
        }
        return result;
    }
    
    func max(array: Array<Int>) -> Int {
        var max = array[0]
        var result = 0
        for index in 1..<array.count {
            if (array[index] > max) {
                result = index;
                max = array[index]
            }
        }
        return result;
    }
    
    override func move() {
        minimax(board, player: self.figure)
        println("Stat minimax \(minimaxCall) score \(scoreCall)")
        
        board.set(choice, figure: figure)
    }
}