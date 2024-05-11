//
//  ContentView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/10/24.
//
// Will's comment

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: DuckView()) {
                ZStack {
                    LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    VStack {
                        Image("duck")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .position(CGPoint(x: 175, y: 150))
                            .overlay(
                        Circle()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.blue)
                            .ignoresSafeArea()
                            .overlay(
                                Text("Duck Clicker")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        )
                            .padding()
                        Text("Click Anywhere to Start")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
            .navigationTitle("Menu")
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    ContentView()
}
