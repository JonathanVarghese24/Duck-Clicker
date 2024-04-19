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
