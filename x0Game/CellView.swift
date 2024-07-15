//
//  CellView.swift
//  x0Game
//
//  Created by Bryan Mejia on 11/11/23.
//

import SwiftUI

struct CellView: View {
    
    @Binding var player: Player?
    @Binding var currentPlayer: Player
    @Binding var winner: Player?
    var gridView: GridView
    
    var body: some View {
        Button(action: {
            guard player == nil, winner == nil else{ return }
            player = currentPlayer
            if gridView.checkWinner(board: gridView.board){
                winner = currentPlayer
            }else{
                withAnimation(.smooth){
                    currentPlayer.toogle()
                }
                
                if currentPlayer == .o {
                    withAnimation(.smooth){
                        gridView.computerMove()
                    }
                }
            }
            
        }){
            Text(player?.rawValue ?? "")
                .font(.largeTitle)
                .frame(width: 120 , height: 130)
                .background(Color.white)
                .cornerRadius(9)
                .shadow(color: .white.opacity(0.3), radius: 5 , x: -1 , y: -3)
                .shadow(color: .white.opacity(0.3), radius: 5 , x: 1 , y: 3)
                .opacity(player == nil ? 0.75 : 1)
        }
    }
}

#Preview {
    ContentView()
}
