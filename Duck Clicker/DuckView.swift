import SwiftUI
struct DuckView: View {
    @State private var score: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var twoScore: Int = 0
<<<<<<< HEAD
    @State private var clicked: Int = 0
=======
>>>>>>> dev
    var body: some View {
        ZStack {
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack {
                Button(action: {
                    if twoScore == 1 {
                        score = score + 2
                    }
                    else {
                        score = score + 1
                    }
                    
                    
                })
                {
                    Image("duck")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }
                Text("Your have \(score) Ducks")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                NavigationLink(destination: UpgradesView(clicks: $score, doubleScore: $twoScore)) {
                    Text("Upgrades")
                }
                
                .buttonStyle(.borderedProminent)
                
                .padding()
                Button(action: {
                    // Go back to the previous view
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Menu")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}
#Preview {
    DuckView()
}

