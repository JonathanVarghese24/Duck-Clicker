//
//  UpgradesView.swift
//  Duck Clicker
//
//  Created by Jonathan Varghese on 4/10/24.
//
import SwiftUI
enum ActiveAlert {
    case first, second
}

struct UpgradesView: View {
    @Binding var clicks: Int
    @Environment(\.presentationMode) var presentationMode
    @Binding var doubleScore: Int
    @State private var printer: Int = 0
    @State private var fabricator: Int = 0
    @State private var ducks: Int = 0
    @State private var timer: Timer?
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first
    @State private var canClick2X = true
    @State private var canClickPrinter = true
    @State private var canClickFabricator = true
    
    
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
                        if doubleScore >= 1 {
                            canClick2X = false
                            self.activeAlert = .first
                        } else if clicks >= 25 && canClick2X && doubleScore < 1 {
                            clicks -= 25
                            doubleScore += 1
                            canClick2X = false
                            self.activeAlert = .first
                        } else if clicks < 25 {
                            self.activeAlert = .second
                        }
                        self.showAlert = true
                    })
                    {
                        VStack{
                            HStack{
                                Text("2x ") .fontWeight(.bold)
                                
                                Text("Clicks").fontWeight(.bold)
                                    .padding(.leading, -8)
                            }
                            .background(canClick2X ? Color.blue : Color.gray)
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
                    .disabled(!canClickPrinter) // Disable the button if it has been clicked
                    .buttonStyle(.borderedProminent)
                    Button(action: {
                        if printer >= 1 {
                            canClickPrinter = false
                            self.activeAlert = .first
                        } else if clicks >= 25 && canClickPrinter && printer < 1 {
                            clicks -= 25
                            printer += 1
                            startTimerTen()
                            canClickPrinter = false
                            self.activeAlert = .first
                        } else if clicks < 25 {
                            self.activeAlert = .second
                        }
                        self.showAlert = true
                    })
                    {
                        VStack{
                            HStack{
                                Text("Duck Printer + 0.1 a second") .fontWeight(.bold)
                                
                            }
                            .background(canClickPrinter ? Color.blue : Color.gray)
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
                        if fabricator >= 1 {
                            canClickFabricator = false
                            self.activeAlert = .first
                            self.showAlert = true
                        } else if clicks >= 25 && canClickFabricator && fabricator < 1 {
                            clicks -= 25
                            fabricator += 1
                            startTimer()
                            canClickFabricator = false
                            self.activeAlert = .first
                        } else if clicks < 25 {
                            self.activeAlert = .second
                        }
                        self.showAlert = true
                    })
                    {
                        VStack{
                            HStack{
                                Text("Duck Fabricator + 1 a second") .fontWeight(.bold)
                                
                            }
                            .background(canClickFabricator ? Color.blue : Color.gray)
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
                    VStack{
                        Text("You Can Buy More than")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                        Text("1 Fabricator and Printer!")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                    }
                    
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
        .alert(isPresented: $showAlert) {
            switch activeAlert {
            case .first:
                return Alert(title: Text("You've Purchased This Upgrade"), message: Text("Click The Duck To Get More Points"))
            case .second:
                return Alert(title: Text("You Don't Have Enough Points"), message: Text("Save Ducks To Now Buy New Upgrades!"))
            }
        }
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
