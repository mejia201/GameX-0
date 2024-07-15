import SwiftUI

struct ContentView: View {
    

    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
           
                Image("icono")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                
                //Dirigir a filtro 1
                NavigationLink(destination: GameView()) {
                    Text("Iniciar juego")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .shadow(radius: 5)
                }
                
                NavigationLink(destination: DevView()) {
                    Text("Desarrollador")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .shadow(radius: 5)
                }
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
