//
//  GameView.swift
//  x0Game
//
//  Created by Bryan Mejia on 11/11/23.
//

import SwiftUI

struct GameView: View {
    
    @State private var board: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    @State private var currentPlayer: Player = .x
    @State private var playerName: String = ""
    @State private var winner: Player?
    @State private var xWins: Int = 0
    @State private var oWins: Int = 0
    @State private var dissmissWinner: Bool = false
    @State private var backgroundColor: Color = Color.cyan
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .fill(Color.orange.gradient)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 15){
                
                HStack{
                    if playerName.isEmpty {
                        Text("Jugador X: \(xWins)")
                            .contentTransition(.numericText(value: Double(xWins)))
                    } else {
                        Text("\(playerName): \(xWins)")
                            .contentTransition(.numericText(value: Double(xWins)))
                    }
                    
                    Spacer()
                    Text("Puntuación")
                    Spacer()
                    
                    Text("O Wins: \(oWins)")
                        .contentTransition(.numericText(value: Double(oWins)))
                }
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding()
                
                Spacer()
                
                Text("Tic-Tac-Toe")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                GridView(board: $board, currentPlayer: $currentPlayer, winner: $winner, xWins: self.$xWins, oWins: self.$oWins, backgroundColor: self.$backgroundColor)
                
                if winner != nil{
                    
                }else{
                    if currentPlayer == .x{
                        
                        TextField("Ingrese su nombre", text: $playerName)
                                .font(.title3.bold())
                                .foregroundColor(.black)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .multilineTextAlignment(.center)
                        
                        
                    }else if currentPlayer == .o{
                        Text("\(playerName) (\(currentPlayer.rawValue))")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    }else{
                        
                    }
                }
                
                if currentPlayer.rawValue != winner?.rawValue{
                    Button(action:{
                        withAnimation(.smooth){
                            restartGame()
                        }
                    }) {
                        Text("Reiniciar Juego")
                            .font(.title2.bold())
                            .padding(8)
                            .background(Color.orange.gradient)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(color: .gray, radius: 2, x: -1,y: -2)
                            .shadow(color: .gray, radius: 2, x: 1,y: 2)
                        
                    }
                }
                
                Spacer()
            }
            
            .background(backgroundColor.gradient)
            .animation(.default, value: backgroundColor)
            
            if currentPlayer.rawValue == winner?.rawValue{
                withAnimation(.smooth){
                    ZStack{
                        Rectangle()
                            .fill(Color.orange.gradient)
                            .frame(width: 230 , height: 220)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: -1 , y: -2)
                            .shadow(color: .gray, radius: 5, x: 1 , y: 2)
                        
                        VStack(spacing: 10){
                            
                            if currentPlayer == .x{
                                
                                if playerName.isEmpty {
                                    Text("Jugador x")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .padding()
                                } else {
                                    Text("\(playerName)")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .padding()
                                }
                                

                            }else{
                                Text("Bots (\(currentPlayer.rawValue))")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                            }
                            
                            Text("Gana!!")
                                .font(.title.bold())
                                .foregroundStyle(.white)
                            
                            Image(systemName: "gift.fill")
                                .font(.title.bold())
                                .foregroundStyle(.red)
                            
                            Button(action:{
                                withAnimation(.smooth){
                                    restartGame()
                                }
                            }){
                                Text("Nuevo Juego")
                                    .padding(8)
                                    .background(Color.black.gradient)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .shadow(color: .green, radius: 2, x: -1,y: -1)
                                    .shadow(color: .green, radius: 2, x: 1,y: 1)
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func restartGame(){
        board = Array(repeating: Array(repeating: nil , count: 3), count: 3)
        currentPlayer = .x
        xWins = 0
        oWins = 0
        winner = nil
        playerName = ""
    }
}

#Preview {
    GameView()
}
