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
    @State private var doubleScore: Int = 0
    @State private var doublePressCount = 0
    @State private var showNoPointsMessage = false
    @State private var canClickButton = true 

    var body: some View {
        ZStack {
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack {
                Text("Upgrades")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Spacer()
                    .navigationBarBackButtonHidden(true)
                VStack {
                    Text("Your Score is \(clicks)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)

                    Button(action: {
                        if clicks >= 5 && canClickButton {
                            clicks -= 5
                            doublePressCount += 1
                            if doublePressCount % 2 == 1 {
                                doubleScore += 1
                            } else {
                                doubleScore -= 1
                            }
                            canClickButton = false // Disable the button after clicking
                        } else {
                            showNoPointsMessage = true
                        }
                    }) {
                        Text("2x Clicks")
                            .padding()
                            .background(canClickButton ? Color.blue : Color.gray) // Disable the button if it has been clicked
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(!canClickButton) // Disable the button if it has been clicked

                    Text("Lose 500 score, but each click is now +2 score")
                        .buttonStyle(.borderedProminent)

                    .navigationBarTitle("Upgrades", displayMode: .inline)
                    .navigationBarHidden(true)
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Go Back")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .alert(isPresented: $showNoPointsMessage) {
            Alert(
                title: Text("Not Enough Points"),
                message: Text("You need at least 5 points to use this upgrade."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    UpgradesView(clicks: .constant(0))
}
