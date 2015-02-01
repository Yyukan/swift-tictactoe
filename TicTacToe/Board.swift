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
    
    init() {
    
    }
   
    func set(index: Int, figure: Figure) {
        board[index] = figure
    }
    
    func isMovePossible() -> Bool {
        return board.filter{ $0 == Figure.EMPTY}.count > 0
    }
    
    func row(row: Int) -> String {
        
        let start = row * Boards.width
        let end = row * Boards.width + Boards.width - 1
        
        return "|".join(board[start...end].map { $0.description })
    }
    
    func winner() -> Figure? {
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
