//
//  UpgradesView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/19/24.
//

import SwiftUI
struct UpgradesView: View {
    @State private var twoscore: Bool = false
    @Binding var clicks: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
            
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()
                VStack{
                    
                    Text("Upgrades")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                    Spacer()
                        .navigationBarBackButtonHidden(true)
                    VStack {
                        Text("Your Score is \(clicks)")
                        
                        Text("Lose 1000 score, but each click is now +2 score")
                            .buttonStyle(.borderedProminent)
                            .navigationBarTitle("Upgrades", displayMode: .inline)
                            .navigationBarHidden(true)
                        Spacer()
                        Button(action: {
                                      // Go back to the previous view
                                      presentationMode.wrappedValue.dismiss()
                                  }) {
                                      Text("Go Back")
                                          .foregroundColor(.white)
                                          .padding()
                                          .background(Color.blue)
                                          .cornerRadius(10)
                                  }}
            }
        }
    }
}
#Preview {
    UpgradesView(clicks: .constant(0))
}
