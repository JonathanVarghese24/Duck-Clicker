
//important theres an error whenever you buy an upgrade, this could be because i add a second button and it somehow cancels it out i dont know but if you buy the button again it resets your click to 1 instead of saying that you cant buy it//





import SwiftUI
struct UpgradesView: View {
    @State private var twoscore: Bool = false
    @Binding var clicks: Int
    @Environment(\.presentationMode) var presentationMode
    @Binding var doubleScore: Int
    @State private var doublePressCount = 0
    @State private var showNoPointsMessage = false
    @State private var canClickButton = true
    @State private var ducks: Int = 25
    
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
                        
                        if clicks >= 25 && canClickButton {
                            clicks -= 25
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
                            doublePressCount += 1  //need to change this to a different variable for the next upgrade
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
                            doublePressCount += 1  //need to change this to a different variable for the next upgrade
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
    }
}

#Preview {
    UpgradesView(clicks: .constant(0), doubleScore: .constant(0))
}
