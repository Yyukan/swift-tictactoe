//
//  Figure.swift
//  TicTacToe
//
//  Created by Oleksandr Shtykhno on 01/02/15.
//  Copyright (c) 2015 Oleksandr Shtykhno. All rights reserved.
//

import Foundation

enum Figure : String, Printable {
    case ZERO = "0"
    case CROSS = "X"
    case EMPTY = " "
    
    var description : String {
        get {
            return self.rawValue
        }
    }
}
