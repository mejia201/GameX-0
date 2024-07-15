//
//  Jugador.swift
//  x0Game
//
//  Created by Bryan Mejia on 11/11/23.
//

import Foundation
import SwiftUI

enum Player: String{
    case x = "x"
    case o = "O"
    
    mutating func toogle(){
        switch self{
        case .x: self = .o
        case .o: self = .x
            
        }
    }
}
