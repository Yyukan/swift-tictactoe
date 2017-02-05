//
//  Figure.swift
//  TicTacToe
//
//  Created by Oleksandr Shtykhno on 01/02/15.
//  Copyright (c) 2015 Oleksandr Shtykhno. All rights reserved.
//

import Foundation

enum Figure : String, CustomStringConvertible {
    case zero = "0"
    case cross = "X"
    case empty = " "
    
    var description : String {
        get {
            return self.rawValue
        }
    }
}
