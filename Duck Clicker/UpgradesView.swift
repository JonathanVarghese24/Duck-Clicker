//
//  UpgradesView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/10/24.
//
import SwiftUI
struct UpgradesView: View {
    @State private var twoscore: Bool = false
    @Binding var clicks: Int
    @Environment(\.presentationMode) var presentationMode
    @Binding var doubleScore: Int
    @State private var doublePressCount = 0
    @State private var showNoPointsMessage = false
    @State private var purchasedUpgrade = false
    @State private var canClickButton = true
    @State private var ducks: Int = 25
    @State private var timer: Timer?
    
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
                    HStack{
                        Text("You have \(clicks)")
                            
                        Image("duck")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, -12)
                    }
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Button(action: {
                        if doubleScore >= 1{
                            canClickButton = false
                            purchasedUpgrade = true
                        }
                        else {
                            if clicks >= 25 && canClickButton {
                                clicks -= 25
                                doubleScore += 1
                                if doubleScore == 1 {
                                    canClickButton = false
                                    
                                } else {
                                    doubleScore += 0
                                }
                                canClickButton = false // Disable the button after clicking
                            } else {
                                showNoPointsMessage = true
                            }
                        }
                        
                    }) {
                        VStack{
                            HStack{
                                Text("2x ") .fontWeight(.bold)
                                    
                                Text("Clicks").fontWeight(.bold)
                                    .padding(.leading, -8)
                            }
                                .background(canClickButton ? Color.blue : Color.gray) 
                            // button cant click if used already 
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                //leave this space for seperation of hstacks
                            HStack(spacing: 0){
                                Image("duck")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Text("25")
                                    .padding(.leading, -2)
                            }
                            .padding(.top, -15)
                            
                        }

                    }
                    .disabled(!canClickButton) // Disable the button if it has been clicked
                                            .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        if clicks >= 25 && canClickButton {
                            clicks -= 25
                            startTimerTen()
                            canClickButton = false
                        } else {
                            showNoPointsMessage = true
                        }
                    }){
                        VStack{
                            HStack{
                                Text("Duck Printer + 0.1 a second") .fontWeight(.bold)
                                    
                            }
                                .background(canClickButton ? Color.blue : Color.gray)
                            // button cant click if used already
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                //leave this space for seperation of hstacks
                            HStack(){
                                Image("duck")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Text("25")
                            }
                            .padding(.top, -15)
                            
                        }

                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        if clicks >= 25 && canClickButton {
                            clicks -= 25
                            startTimer()
                            canClickButton = false
                        } else {
                            showNoPointsMessage = true
                        }
                    }) {
                        VStack{
                            HStack{
                                Text("Duck Fabricator + 1 a second") .fontWeight(.bold)
                                
                            }
                            .background(canClickButton ? Color.blue : Color.gray)
                            // button cant click if used already
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            //leave this space for seperation of hstacks
                            HStack(){
                                Image("duck")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Text("25")
                            }
                            .padding(.top, -15)
                        }
                    }
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
                            .cornerRadius(50)
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
        .alert(isPresented: $purchasedUpgrade) {
            Alert(
                title: Text("You already Own This Upgrade!"),
                message: Text("Save Up Ducks To Get New Upgrades."),
                dismissButton: .default(Text("OK"))
        )}
    }
    
    func startTimerTen() {
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            clicks += 1
        }
    }
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            clicks += 1
        }
    }
}

#Preview {
    UpgradesView(clicks: .constant(0), doubleScore: .constant(0))
}
