//
//  ContentView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()
            VStack {
                Image("duck")
                    .frame(width: 10, height: 10)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 350, height: 350)
                    .overlay(
                        
                        Text("Duck Clicker")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.yellow))
                    .padding()
                
                Button("Click to Start") { 
                    
                }
                    .buttonStyle(.borderedProminent)
                    .tint(.yellow)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
