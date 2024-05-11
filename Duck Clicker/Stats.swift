//
//  Stats.swift
//  Duck Clicker
//
//  Created by William Dunkel on 4/24/24.
//

import SwiftUI

struct Stats: View {
    @Binding var ducks: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack{
                Text("You have clicked the duck \(ducks) times!")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding()
                Text("Get To 100 Total Clicks")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                Text("To Get A New Skin!")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding()
                
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Go Back")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(50)
                    }
            }
        }
        .navigationBarTitle("Statistics", displayMode: .inline)
        .navigationBarHidden(true)
    }
    
}

#Preview {
    Stats(ducks: .constant(0))
}

