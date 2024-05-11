//
//  DuckView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/10/24.
//

import SwiftUI
struct DuckView: View {
    @State private var score: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var twoScore: Int = 0
    @State private var seconds: Int = 0
    @State private var clicked: Int = 0
    @State private var printer: Int = 0
    @State private var fabricator: Int = 0
    var body: some View {
        ZStack {
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack {
                Button(action: {
                    clicked += 1
                    if twoScore >= 1 {
                        score = score + 2
                    }
                    else {
                        score = score + 1
                    }
                    
                    
                })
                {
                    if clicked >= 100 {
                        Image("kingDuck")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                    }
                    else {
                        Image("duck")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                    }
                }
                Text("Your have \(score) Ducks")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                NavigationLink(destination: UpgradesView(clicks: $score, doubleScore: $twoScore, printer: $printer, fabricator: $fabricator)) {
                    Text("Upgrades")
                }
                .frame(width: 200, height: 60)
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: Stats(ducks: $clicked)) {
                    Text("Stats  ")
                }
                .frame(width: 200, height: 60)
                .buttonStyle(.borderedProminent)
                Spacer()
                
                Button(action: {
                    // Go back to the previous view
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Reset")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
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
