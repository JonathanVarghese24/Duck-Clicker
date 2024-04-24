//
//  DuckView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/17/24.
//

import SwiftUI

struct DuckView: View {
    @State private var score: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var twoScore: Int = 0
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
                Text("Your Score is \(score)")
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
