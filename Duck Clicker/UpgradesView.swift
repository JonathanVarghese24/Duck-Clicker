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
    var body: some View {
        VStack {
            Text("Your Score is \(clicks)")
            
            Button(action: {

            })
            Text("Lose 1000 score, but each click is now +2 score")
                .buttonStyle(.borderedProminent)
                .navigationBarTitle("Upgrades", displayMode: .inline)
        }
    }
}
#Preview {
    UpgradesView(clicks: .constant(0))
}
