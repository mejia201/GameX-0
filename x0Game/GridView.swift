//
//  GridView.swift
//  x0Game
//
//  Created by Bryan Mejia on 11/11/23.
//

import SwiftUI

struct GridView: View {
    
    @Binding var board: [[Player?]]
    @Binding var currentPlayer: Player
    @Binding var winner: Player?
    
    @Binding var xWins: Int
    @Binding var oWins: Int
    
    @Binding var backgroundColor: Color
    
    
    var body: some View {
        
        ForEach(0..<3){ row in
            HStack(spacing: 10){
                ForEach(0..<3){ col in
                    CellView(player: $board[row][col], currentPlayer: $currentPlayer, winner: $winner, gridView: self)
                    
                }
            }
        }
    }
    
    
    
    func checkWinner(board: [[Player?]]) -> Bool {
        for i in 0..<3 {
            
            if let player = board[i][0], player == board[i][1], player == board[i][2] {
                winner = player
                incrementWinCount(for: player)
                return true
            }
            
            if let player = board[0][i], player == board[1][i], player == board[2][i] {
                winner = player
                incrementWinCount(for: player)
                return true
            }
        }
        
        if let player = board[0][0], player == board[1][1], player == board[2][2] {
            winner = player
            incrementWinCount(for: player)
            return true
        }
        
        if let player = board[0][2], player == board[1][1], player == board[2][0] {
            winner = player
            incrementWinCount(for: player)
            return true
        }
        
        return false
    }
    
    func incrementWinCount(for player: Player){
        if player == .x {
            xWins += 1
            backgroundColor = Color(red: 1.0, green: 0.5 + 0.1 * Double(xWins), blue: 0.5)
        }else{
            
            oWins += 1
            backgroundColor = Color(red: 0.5, green: 0.5, blue: 0.5 + 0.1 * Double(oWins))
            
        }
    }
    
    func computerMove(){
        guard winner == nil else { return }
        
        let availablePositions = board.enumerated().flatMap{ row, columns in
            columns.enumerated().compactMap{ col, player in
                
                withAnimation(.spring){
                    player == nil ? (row, col): nil
                }
            }
        }
        
        guard let randomPosition = availablePositions.randomElement() else {return}
        board[randomPosition.0][randomPosition.1] = currentPlayer
        
        if checkWinner(board: board){
            withAnimation(.spring){
                winner = currentPlayer
            }
        }
        else{
                
                withAnimation(.spring){
                    currentPlayer.toogle()
                
            }
        }
    }
    
    
    
}

#Preview {
    ContentView()
}

extension Color {
    static var random: Color {
        Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1))
    }
}
