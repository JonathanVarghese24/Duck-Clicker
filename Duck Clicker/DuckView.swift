//
//  DuckView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/17/24.
//

import SwiftUI

struct DuckView: View {
    @State private var score: Int = 0
    var body: some View {
        ZStack {
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack {
                Button(action: {
                    score = score + 1
                }) {
                    Image("duck")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }
                Text("Your Score is \(score)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    DuckView()
}
