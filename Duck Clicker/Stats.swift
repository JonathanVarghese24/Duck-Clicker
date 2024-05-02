//
//  Stats.swift
//  Duck Clicker
//
//  Created by William Dunkel on 4/24/24.
//

import SwiftUI

struct Stats: View {
    var body: some View {
        ZStack{
            Color.blue.opacity(0.8).ignoresSafeArea()
            VStack{
                Text("Statistics")
                    .font(.system(size: 50
                                ))
                    .fontWeight(.bold)
                Spacer()
                Text("You have clicked 0 times")
            }
        }
    }
}

#Preview {
    Stats()
}
