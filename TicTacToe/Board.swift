//
//  Board.swift
//  TicTacToe
//
//  Created by Oleksandr Shtykhno on 01/02/15.
//  Copyright (c) 2015 Oleksandr Shtykhno. All rights reserved.
//

import Foundation

struct Boards {
    static let width : Int = 3
    static let height : Int = 3
}

class Board : Printable {
    
    var board = [Figure](count: Boards.width * Boards.height, repeatedValue: Figure.EMPTY)
    
    func set(index: Int, figure: Figure) {
        board[index] = figure
    }
    
    func isMovePossible() -> Bool {
        return (board.filter{ $0 == Figure.EMPTY}.count > 0 && winner() == nil)
    }
    
    func row(row: Int) -> String {
        
        let start = row * Boards.width
        let end = row * Boards.width + Boards.width - 1
        
        return "|".join(board[start...end].map { $0.description })
    }
    
    func get(row: Int, column: Int) -> Figure {
        return board[row * Boards.width + column]
    }

    /**
     * Defines winner by checking rows, columns and diagonals for the same type of the figure (CROSS or ZERO)
     */
    func winner() -> Figure? {
        
        func isSame(array:Array<Figure>) -> Figure? {
            let figures = array.filter{$0 != Figure.EMPTY}
            if (figures.count > 0) {
                if (figures.filter{$0 == Figure.CROSS}.count == array.count) {
                    return Figure.CROSS
                }
                if (figures.filter{$0 == Figure.ZERO}.count == array.count) {
                    return Figure.ZERO
                }
            }
        
            return nil
        }
        
        // check rows
        for row in 0..<Boards.height {
            var array : Array<Figure> = []
            for column in 0..<Boards.width {
                array.append(get(row, column: column))
            }

            if let figure = isSame(array) {
                return figure
            }
            
            array.removeAll(keepCapacity: true)
        }
        
        
        // check columns
        for column in 0..<Boards.height {
            var array : Array<Figure> = []
            for row in 0..<Boards.width {
                array.append(get(row, column: column))
            }
            
            if let figure = isSame(array) {
                return figure
            }
            
            array.removeAll(keepCapacity: true)
        }
        
        
        // check forward diagonal
        var array : Array<Figure> = []

        for index in 0..<Boards.width {
            array.append(get(index, column: index))
        }
        
        if let figure = isSame(array) {
            return figure
        }

        array.removeAll(keepCapacity: true)

        // check backward diagonal
        for index in 0..<Boards.width {
            array.append(get(index, column: Boards.width - index - 1))
        }
        
        if let figure = isSame(array) {
            return figure
        }
        
        return nil
    }
    
    var description : String {
        var result = ""

        for index in 0...Boards.height - 1 {
            result += row(index) + "\n"
        }
        
        return result
    }
}
