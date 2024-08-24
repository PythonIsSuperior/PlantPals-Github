//
//  ContentView.swift
//  Fertilizer App
//
//  Created by Gavin Wagner on 1/23/24.
//
// NEED to
//    Make global variables
//    Load crop list with pH & sources
//    Load fertilizer list
//    Load Table 7-1 info
//    Make/display graphics
// hello yodeler
// I like bananas
// I like oranges
// I like both

import SwiftUI
class PileOfRubbish: ObservableObject {
   
    @Published var pH: Double = 6.0
    @Published var phosphorus: Double = 50
    @Published var potassium: Double = 50
    @Published var magnesium: Double = 100
    @Published var calcium: Double = 2000
    
    @Published var area: Double = 1
    @Published var numberOfTrees: Double = 5
    @Published var lengthOfRow: Double = 125
    @Published var sizeOfFieldAcres: Double = 0.004
    @Published var whichOneLastEntered: String = "Tree"
    @Published var areaInSquareFeet: Double = 250
    
   
    // ----CropType-----------------------
   
    // Define CropType enum used below
    enum CropType: String, CaseIterable {
        case row
        case tree
        case field
    }
   
    struct CropData: Identifiable, Hashable {
        let id = UUID()
        let cropName: String
        let cropType: CropType
        let cropPH: Double
        let cropFertCost: Double
        let cropLink: String
    }
   
    // Sample crop data
    @Published var cropData: [CropData] = [
        CropData(cropName: "asparagus", cropType: .row, cropPH: 6.4, cropFertCost: 3, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "avocado", cropType: .tree, cropPH: 6.35, cropFertCost: 4, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "banana", cropType: .tree, cropPH: 4.85, cropFertCost: 5, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "basil", cropType: .row, cropPH: 6.4, cropFertCost: 6, cropLink: "https://www.pickyourown.org/ph_of_fruits_and_vegetables_list.htm"),
            CropData(cropName: "Bermuda grass", cropType: .field, cropPH: 6.25, cropFertCost: 7, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "broccoli", cropType: .row, cropPH: 6.4, cropFertCost: 8, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "cabbage", cropType: .row, cropPH: 6.4, cropFertCost: 9, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "cacao", cropType: .tree, cropPH: 6, cropFertCost: 0, cropLink: "https://www.icco.org/wp-content/uploads/2019/07/7.-Rep.Dominicana.-World-Cocoa-Urena.pdf"),
            CropData(cropName: "carrot", cropType: .row, cropPH: 6.4, cropFertCost: 9, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "cilantro", cropType: .row, cropPH: 6.5, cropFertCost: 8, cropLink: "https://extension.psu.edu/cilantro-a-unique-culinary-herb#:~:text=First%2C%20you%20want%20to%20ensure,most%20herbs%20and%20vegetables%20require."),
            CropData(cropName: "coconut", cropType: .tree, cropPH: 7, cropFertCost: 7, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "coffee", cropType: .tree, cropPH: 5.5, cropFertCost: 6, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "corn", cropType: .row, cropPH: 6.1, cropFertCost: 6, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "dragonfruit", cropType: .row, cropPH: 6.5, cropFertCost: 5, cropLink: "https://calpolypomonanursery.com/plant-care/Plantcare#:~:text=Dragon%20fruit%20soil%20should%20be,roots%20dislike%20being%20water%2Dlogged."),
            CropData(cropName: "ginger", cropType: .row, cropPH: 6.4, cropFertCost: 54, cropLink: "https://www.pickyourown.org/ph_of_fruits_and_vegetables_list.htm"),
            CropData(cropName: "guava", cropType: .tree, cropPH: 6.15, cropFertCost: 4, cropLink: "https://www.pickyourown.org/ph_of_fruits_and_vegetables_list.htm"),
            CropData(cropName: "Kabocha (pumpkin)", cropType: .row, cropPH: 6.4, cropFertCost: 4, cropLink: "https://www.westcoastseeds.com/products/first-taste-kabocha#"),
            CropData(cropName: "kalo", cropType: .row, cropPH: 6, cropFertCost: 5, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "Kikuyu grass", cropType: .field, cropPH: 6, cropFertCost: 65, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "lemons", cropType: .tree, cropPH: 6.4, cropFertCost: 6, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "lettuce", cropType: .row, cropPH: 6.4, cropFertCost: 7, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "lilikoi", cropType: .row, cropPH: 5.5, cropFertCost: 78, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "lime", cropType: .tree, cropPH: 6.4, cropFertCost: 8, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "lychee", cropType: .tree, cropPH: 6, cropFertCost: 7, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "macadamia", cropType: .tree, cropPH: 5.75, cropFertCost: 6, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "Mango", cropType: .tree, cropPH: 6.15, cropFertCost: 6, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "mint", cropType: .row, cropPH: 6.4, cropFertCost: 5, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "onions", cropType: .row, cropPH: 6.4, cropFertCost: 5, cropLink: "https://www2.hawaii.edu/~hector/prod%20guides%20fold/onion%20HI-HV99.pdf"),
            CropData(cropName: "orange", cropType: .tree, cropPH: 6.15, cropFertCost: 45, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "papaya", cropType: .tree, cropPH: 6.15, cropFertCost: 4, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "peanuts", cropType: .row, cropPH: 6.4, cropFertCost: 5, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "pineapple", cropType: .row, cropPH: 5.1, cropFertCost: 5, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "potato", cropType: .row, cropPH: 6.4, cropFertCost: 6, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "squash", cropType: .row, cropPH: 6.4, cropFertCost: 7, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "sugarcane", cropType: .row, cropPH: 5.75, cropFertCost: 8, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "tomato", cropType: .row, cropPH: 6.4, cropFertCost: 7, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "ulu", cropType: .tree, cropPH: 6.4, cropFertCost: 6, cropLink: "https://www.ctahr.hawaii.edu/oc/freepubs/pdf/pnm10.pdf"),
            CropData(cropName: "palm, red lipstick tree", cropType: .tree, cropPH: 6.5, cropFertCost: 6, cropLink: "https://landscapeplants.aub.edu.lb/Plants/GetPDF/f787be58-3d73-41cd-a07a-1d99db5ddeac")
]
   
    // ------SoilType---------------------
   
    // Define SoilType enum used below
    enum SoilType: String, CaseIterable {
        case aa
        case Light
        case Heavy
    }
   
    struct SoilData: Identifiable, Hashable {
        let id = UUID()
        let soilOrder: String
        let soilDensity: SoilType
    }
   
    @Published var soilInfo: [SoilData] = [
        SoilData(soilOrder: "Andisol", soilDensity: .Light),
        SoilData(soilOrder: "Aridisol", soilDensity: .Heavy),
        SoilData(soilOrder: "Entisol", soilDensity: .Heavy),
        SoilData(soilOrder: "Histisol", soilDensity: .Light),
        SoilData(soilOrder: "Mollisol", soilDensity: .Heavy),
        SoilData(soilOrder: "Oxisol", soilDensity: .Heavy),
    ]
   
}
//Call functions like this -----------------
//Text("P2O5 \(ppmToLbs_P2O5_heavy_soil(ppm : 49))")
//Text("K20 \(ppmToLbs_K2O_heavy_soil(ppm : 249))")
func isStringNumer(string: String) -> Bool {
    return Double(string) != nil
}
func ppmToLbs_P2O5_heavy_soil(ppm: Double) -> Double {
    let ppmData = [0.0,   12.5,  25.0,   35.0, 50.0, 60.0, 80.0]
    let lbsData = [890.0, 620.0, 360.0, 160.0, 0.0,  0.0 , 0.0]
     
    // Check if ppm is within the given range
    if ppm <= ppmData.first! {
        return lbsData.first!
    } else if ppm >= ppmData.last! {
        return lbsData.last!
    }
   
    // Find the index of the first ppm value greater than the given ppm
    var startIndex = 0
    for i in 0..<ppmData.count {
        if ppmData[i] > ppm {
            startIndex = i - 1
            break
        }
    }
   
    // Linear interpolation
    let x0 = ppmData[startIndex]
    let x1 = ppmData[startIndex + 1]
    let y0 = lbsData[startIndex]
    let y1 = lbsData[startIndex + 1]
   
    return y0 + (ppm - x0) * (y1 - y0) / (x1 - x0)
}
func ppmToLbs_K2O_heavy_soil(ppm: Double) -> Double {
    let ppmData = [0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0]
    let lbsData = [360.0, 290.0, 220.0, 140.0, 70.0, 0.0, 0.0, 0.0, 0.0, 0.0]
   
    // Check if ppm is within the given range
    if ppm <= ppmData.first! {
        return lbsData.first!
    } else if ppm >= ppmData.last! {
        return lbsData.last!
    }
   
    // Find the index of the first ppm value greater than the given ppm
    var startIndex = 0
    for i in 0..<ppmData.count {
        if ppmData[i] > ppm {
            startIndex = i - 1
            break
        }
    }
   
    // Linear interpolation
    let x0 = ppmData[startIndex]
    let x1 = ppmData[startIndex + 1]
    let y0 = lbsData[startIndex]
    let y1 = lbsData[startIndex + 1]
   
    return y0 + (ppm - x0) * (y1 - y0) / (x1 - x0)
}
// VStack, LEAD = Anwar
struct ContentView: View {
    // Call the function to load the CSV file
    @StateObject var tinyPile = PileOfRubbish()
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Image("ud")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Spacer()
                    Image("ud")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                   
                }
               
                Text("Hawai'i Fertilizer Calculator").font(.system(size: 21, weight: .bold))
                
                Spacer()
               
                Image("Image") // Replace "example" with the actual name of your image file (without extension)
                                .resizable()
                                .cornerRadius(15)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 200) // Adjust the frame size as needed
               
                Spacer()
                NavigationLink(destination: INSTRUCTION(tinyPile : tinyPile))
                {
                    Text("Settings & Help")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
               
                Spacer()
                NavigationLink(destination: SOIL_TEST(tinyPile : tinyPile))
                {
                    Text("Input Soil Test")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                Spacer()
                NavigationLink(destination: RESEARCH(tinyPile : tinyPile))
                {
                    Text("Research Crops")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
};
// VStack, LEAD = Andrew
// VStack, LEAD = Andrew
struct SOIL_TEST: View {
    @ObservedObject var tinyPile: PileOfRubbish
    var body: some View {
        VStack {
            Text("Input Soil Test Results").bold()
            Spacer()
            Text("pH = \(tinyPile.pH, specifier: "%.2f")")
            HStack{
                Spacer(minLength:20)
                Slider(value: $tinyPile.pH,
                       in:   3...8,
                       step: 0.05
                )
                Spacer(minLength:20)
            }
           
           
                       
            Spacer()
            Spacer()
            var plusPh: String {
                if tinyPile.phosphorus == 100{
                   return "+"
               }
               else{
                   return ""
            }
            }
            Text("Phosphorus = \(tinyPile.phosphorus, specifier: "%.0f")\(plusPh) ppm")
            HStack{
                Spacer(minLength:20)
            Slider(value: $tinyPile.phosphorus,
                   in:   0...100,
                   step: 1
            )
                Spacer(minLength:20)
            }
           
           
                       
            Spacer()
            Spacer()
            var plusP: String {
                if tinyPile.potassium == 500{
                   return "+"
               }
               else{
                   return ""
            }
            }
            Text("Potassium = \(tinyPile.potassium, specifier: "%.0f")\(plusP) ppm")
                HStack{
                    Spacer(minLength:20)
                Slider(value: $tinyPile.potassium,
                       in:   0...500,
                       step: 10
                )
                    Spacer(minLength:20)
                }
           
                       
            Spacer()
            Spacer()
            
            var plusM: String {
                if tinyPile.magnesium == 800{
                   return "+"
               }
               else{
                   return ""
            }
            }
            Text("Magnesium = \(tinyPile.magnesium, specifier: "%.0f")\(plusM) ppm")
                    HStack{
                        Spacer(minLength:20)
            Slider(value: $tinyPile.magnesium,
                   in:   0...800,
                   step: 10
            )
                        Spacer(minLength:20)
                    }
           
                       
            Spacer()
            Spacer()
            var plusC: String {
                if tinyPile.calcium == 4000{
                   return "+"
               }
               else{
                   return ""
            }
            }
            Text("Calcium = \(tinyPile.calcium, specifier: "%.0f")\(plusC) ppm")
            HStack{
              Spacer(minLength:20)
            Slider(value: $tinyPile.calcium,
                   in:   0...4000,
                   step: 10
            )
                Spacer(minLength:20)
            }
           
                       
            Spacer()
           
            NavigationLink(destination: COST_ALL(tinyPile : tinyPile))
            {
               
                Text("Calculate Report")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                   
                   
            }
//            .buttonStyle(ButtonStyle3D(background: Color.yellow))
           
            Spacer()
        }
    }
};


// FORM, LEAD = Anwar
struct INSTRUCTION: View {
    @ObservedObject var tinyPile: PileOfRubbish
    
    @State var numberOfTreesText: String = ""
    @State var lengthOfRowText: String = ""
    @State var sizeOfFieldAcresText: String = ""
    @State var areaInSquareFeetText: String = ""
    @State private var isShowingHowItWorksPopup = false
    @State private var isShowingSoilSamplePopup = false
    @State private var isKeyboardVisible = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Instructions")) {
                    Button(action: {
                        isShowingHowItWorksPopup.toggle()
                    }) {
                        Text("How the app works")
                    }
                    .alert(isPresented: $isShowingHowItWorksPopup) {
                        Alert(title: Text("How the app works"), message: Text("This is where you describe how the app works."), dismissButton: .default(Text("OK")))
                    }
                    
                    Button(action: {
                        isShowingSoilSamplePopup.toggle()
                    }) {
                        Text("Taking a soil sample")
                    }
                    .alert(isPresented: $isShowingSoilSamplePopup) {
                        Alert(title: Text("Taking a soil sample"), message: Text("Instructions for taking a soil sample go here."), dismissButton: .default(Text("OK")))
                    }
                }
                Section(header: Text("Field Size (all are equivalent)")) {
                    ZStack(alignment: .leading) {
                        if numberOfTreesText.isEmpty {
                            Text("\(tinyPile.numberOfTrees) trees (\(Int(tinyPile.areaInSquareFeet)) sq ft)")
                                .foregroundColor(.gray)
                                .padding(.leading, 5)
                        }
                        TextField("", text: $numberOfTreesText, onCommit: handleInput)
                            .keyboardType(.decimalPad)
                            .onTapGesture {
                                numberOfTreesText = ""
                            }
                    }
                    
                    ZStack(alignment: .leading) {
                        if lengthOfRowText.isEmpty {
                            Text("\(Int(tinyPile.areaInSquareFeet / 50 * 25)) foot row (\(Int(tinyPile.areaInSquareFeet)) sq ft)")
                                .foregroundColor(.gray)
                                .padding(.leading, 5)
                        }
                        TextField("", text: $lengthOfRowText, onCommit: handleInput)
                            .keyboardType(.decimalPad)
                            .onTapGesture {
                                lengthOfRowText = ""
                            }
                    }
                    
                    
                    // Add a new row to show area in square feet
                    ZStack(alignment: .leading) {
                        if areaInSquareFeetText.isEmpty {
                            Text("\(Int(tinyPile.areaInSquareFeet)) sq ft field (\(tinyPile.areaInSquareFeet / 43560) acres)")
                                .foregroundColor(.gray)
                                .padding(.leading, 5)
                        }
                        TextField("", text: $areaInSquareFeetText, onCommit: handleInput)
                            .keyboardType(.decimalPad)
                            .onTapGesture {
                                areaInSquareFeetText = ""
                            }
                    }
                    ZStack(alignment: .leading) {
                        if sizeOfFieldAcresText.isEmpty {
                            Text("\(tinyPile.areaInSquareFeet / 43560) acres (\(Int(tinyPile.areaInSquareFeet)) sq ft)")
                                .foregroundColor(.gray)
                                .padding(.leading, 5)
                        }
                        TextField("", text: $sizeOfFieldAcresText, onCommit: handleInput)
                            .keyboardType(.decimalPad)
                            .onTapGesture {
                                sizeOfFieldAcresText = ""
                            }
                    }
                    
                }
            }
            .navigationTitle("App Settings")
            .onAppear(perform: updatePlaceholders)
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                withAnimation(.easeInOut) {
                    isKeyboardVisible = true
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                withAnimation(.easeInOut) {
                    isKeyboardVisible = false
                }
            }
            .overlay(
                Group {
                    if isKeyboardVisible {
                        Button("Done") {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            handleInput() // Ensure input is handled after dismissing the keyboard
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(.bottom, 10)
                        .transition(.move(edge: .bottom))
                    }
                }, alignment: .bottom
            )
        }
    }
    
    private func handleInput() {
        print("handleInput() was called") // Check if this runs
        
        if let trees = Double(numberOfTreesText) {
            tinyPile.numberOfTrees = trees
            tinyPile.whichOneLastEntered = "tree"
            tinyPile.areaInSquareFeet = trees * 50
        } else if let row = Double(lengthOfRowText) {
            tinyPile.lengthOfRow = row
            tinyPile.whichOneLastEntered = "row"
            tinyPile.areaInSquareFeet = (row / 25) * 50
            
            // Update the number of trees based on the new area
            tinyPile.numberOfTrees = tinyPile.areaInSquareFeet / 50
        } else if let acres = Double(sizeOfFieldAcresText) {
            tinyPile.sizeOfFieldAcres = acres
            tinyPile.whichOneLastEntered = "fieldAcre"
            tinyPile.areaInSquareFeet = acres * 43560
            tinyPile.numberOfTrees = tinyPile.areaInSquareFeet / 50
        } else if let sqFt = Double(areaInSquareFeetText) {
            tinyPile.areaInSquareFeet = sqFt
            tinyPile.whichOneLastEntered = "sqft"
            tinyPile.numberOfTrees = sqFt / 50
            tinyPile.lengthOfRow = sqFt / 50 * 25
            tinyPile.sizeOfFieldAcres = sqFt / 43560
        } else {
            clearInvalidInput()
            return
        }
        
        updatePlaceholders()
        
        // Print diagnostic info to the console
        print("Diagnostic Info:")
        print("Number of Trees: \(numberOfTreesText)")
        print("Length of Row: \(lengthOfRowText)")
        print("Size of Field (Acres): \(sizeOfFieldAcresText)")
        print("Area in Square Feet: \(areaInSquareFeetText)")
    }
    
    private func updatePlaceholders() {
        let area = tinyPile.areaInSquareFeet
        let acres = area / 43560
        
        // Format acres with appropriate decimal places
        let acresText: String
        
        if acres > 10 {
            acresText = String(format: "%.1f", acres)
        } else if acres > 1 {
            acresText = String(format: "%.2f", acres)
        } else {
            // For small values, ensure at least one non-zero digit
            acresText = formatSmallAcres(acres)
        }
        
        numberOfTreesText = "\(tinyPile.numberOfTrees) trees (\(Int(area)) sq ft)"
        lengthOfRowText = "\(Int(area / 50 * 25)) foot row (\(Int(area)) sq ft)"
        sizeOfFieldAcresText = "\(acresText) acres (\(Int(area)) sq ft)"
        areaInSquareFeetText = "\(Int(area)) sq ft (\(acresText) acres)"
    }

    private func formatSmallAcres(_ acres: Double) -> String {
        var decimalPlaces = 3
        var factor: Double = 1.0
        
        // Check for very small values
        while true {
            let formattedAcres = String(format: "%.\(decimalPlaces)f", acres * factor)
            // Check if the formatted string is not zero (e.g., not "0.00")
            if formattedAcres != String(repeating: "0", count: 2) + String(repeating: "0", count: decimalPlaces - 1) + "." {
                return formattedAcres
            }
            factor *= 10
            decimalPlaces += 1
            
            // Safety check: If decimalPlaces get too high, break the loop
            if decimalPlaces > 10 {
                return String(format: "%.10f", acres)
            }
        }
    }
    
    private func clearInvalidInput() {
        numberOfTreesText = ""
        lengthOfRowText = ""
        sizeOfFieldAcresText = ""
        areaInSquareFeetText = ""
    }
}





// Wheel Picker & VStack, LEAD = Gavin
struct RESEARCH: View {
    @ObservedObject var tinyPile: PileOfRubbish
   
    @State private var selectedCropType: PileOfRubbish.CropType = .row
    @State private var selectedCropIndex: Int = 0
   
    var body: some View {
     
        VStack {
            //----1st HStack------
            HStack{
                Spacer()
                Text("Research")
                    .font(.system(size: 60))
                    .bold()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            Rectangle()
                .size(width: 400, height: 10)
            //----2nd HStack------
            HStack{
                VStack
                {
                    Text("Type of")
                    Text("crop")
                }
                Picker("Crop Type", selection: $selectedCropType) {
                    ForEach(PileOfRubbish.CropType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized).tag(type)
                    }
                   
                    .pickerStyle(WheelPickerStyle())
                    .padding()
                }
            }
            //---Picker-------
            // Second picker for crop name filtered by crop type
            Picker("Crop Name", selection: $selectedCropIndex) {
                ForEach( filteredCropData.indices, id: \.self) { index in
                    Text(filteredCropData[index].cropName).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()
           
            //----------Display crop information----
            Text("Crop Name: \(filteredCropData[selectedCropIndex].cropName)")
            Text("Crop Type: \(filteredCropData[selectedCropIndex].cropType.rawValue.capitalized)")
            Text("Crop desired pH: \(filteredCropData[selectedCropIndex].cropPH, specifier: "%.2f")")
            Text("Crop pH link:")
            Text("\(filteredCropData[selectedCropIndex].cropLink)")
            Spacer()
            Spacer()
            Spacer()
           
        }
       
    }
    private var filteredCropData: [PileOfRubbish.CropData] {
        return tinyPile.cropData.filter { $0.cropType == selectedCropType }
    }
};
   
// VStack, LEAD = Gavin
struct CROP_INFO: View {
    @ObservedObject var tinyPile: PileOfRubbish
    var body: some View {
        VStack {
            Text("CROP_INFO")
            Spacer()
            Text("Did you know:  tomatoes are actually watermelons?")
            Spacer()
        }
    }
};

// FORM, LEAD = Rayaan
struct COST_ALL: View {
    @ObservedObject var tinyPile: PileOfRubbish
    @State private var selectedIndex: Int?
   
    var body: some View {
        List(tinyPile.cropData) { crop in
            NavigationLink(destination: FERT_DETAILS(tinyPile: tinyPile, crop: crop)) {
                // Calculate the total cost using the calculateCostAndText function
                let (totalCost, _, _) = calculateCostAndText(pH: tinyPile.pH,
                                                             phNeed: crop.cropPH,
                                                             phosphorus: tinyPile.phosphorus,
                                                             potassium: tinyPile.potassium,
                                                             magnesium: tinyPile.magnesium,
                                                             tinyPile: tinyPile,
                                                             soilType: "heavy",
                                                             calcium: tinyPile.calcium)
                
                // Display the calculated total cost
                Text("\(crop.cropName) fertilizer cost = $\(totalCost, specifier: "%.2f") for \(Int(tinyPile.areaInSquareFeet)) sq ft")
            }
        }
        .navigationTitle("Crops")
    }
}


func calculateCostAndText(pH: Double,   // P K Mg Ca are in ppm
                          phNeed: Double,
                          phosphorus: Double,
                          potassium: Double,
                          magnesium: Double,
                          tinyPile: PileOfRubbish,
                          soilType: String,
                          calcium: Double) -> (Double, [String], [String]) {

    var recommendationArray: [String] = []
    var explanationArray: [String] = []
    var totalCost = 0.0
    var adj = 43560 / tinyPile.areaInSquareFeet  // multiply everything by areas adjustment
    
    // costs
    var calcium_nitrate_cost:       Double = 55 / 50  // format for these is $55 for 50 lb bag
    var urea_cost:                  Double = 59 / 50
//    var rock_phosphate_cost:        Double = 50 / 50  // dont have cost for this one
//    var single_superphosphate_cost: Double = 50 / 50  // dont have cost for this one
    var magnesium_sulfate_cost:     Double = 59 / 50
    var triple_superphosphate_cost: Double = 69 / 50
    var sulfate_of_potash_cost:     Double = 70 / 50
    var lime_regular_cost:          Double = 37 / 50
    var lime_dolomite_cost:         Double = 30 / 50
    var sulfur_cost:                Double = 20 / 4
    var gypsum_cost:                Double = 40 / 50
//    var k_mag_sul_po_mag_cost:      Double = 55 / 50
//    var cal_mag_cost:               Double = 70 / 25
    
    var nitrogen: Double{  // want 40 lbs/acre N
        if pH>phNeed{
            let n1=40/0.46  // Urea is  46% N
            return n1
        }
        else{
            let n1=40/0.15  // calcium nitrate is  15% N
            return n1
        }
    }

    
    var magnesiumN: Double = 0.0
    if soilType=="heavy"{
        magnesiumN = 1500-magnesium}
    else{
        magnesiumN = 700-magnesium}
    
    var calciumN: Double = 0.0
    if soilType=="heavy"{
        calciumN = 7000-magnesium}
    else{
        calciumN = 3500-magnesium}
    
    
    //lime variables
    let a1=(-4 * log((185 - 25*phNeed) / 64))
    let a2=(-4 * log((185 - 25*pH) / 64))
    let lime = (a1-a2) * 2000
    
    // NPK
    let lbsP2O5 = ppmToLbs_P2O5_heavy_soil(ppm: phosphorus)
    let lbsK2O = ppmToLbs_K2O_heavy_soil(ppm: potassium)
    
    var nitrogenType: String{
        if pH>phNeed{
            let n1="ammonium sulfate"
            return n1
        }
        else{
            let n1="calcium nitrate"
            return n1
        }
    }
    
    
    // MARK: -Decision 0: checking pH
    
    if lime==0 {
        explanationArray.append(String(format: "pH does not need adjustment"))
        
    }else if lime<0{       // <0 is raise pH -----------------------------------------
        // MARK: -Part 0 Add Sulphur
        let sulphur = (lime) * 0.32
        explanationArray.append(String(format: "pH analysis: \nsoil test pH = %.2f, pH needed is %.2f. Total sulphur in quantity %.0f lbs/acre needed to lower the pH" ,pH,phNeed,sulphur))
        recommendationArray.append(String(format: "Add %.0f lbs/acre elemental Sulphur",sulphur))
        
    }else { // this means lime>0 , need to raise pH -----------------------------------------
        
        explanationArray.append(String(format: "pH analysis: \nsoil test pH = %.2f, pH needed is %.2f. Lime will raise the pH, and the type of lime will be specified below as that depends on the Mg and Ca need",pH,phNeed))
        
        // MARK: -Decision 1: can we meet all Mg w/ Dolomite?
        
        if (magnesiumN/0.19)<=lime{ // if (lime from meeting Mg need with dolomite) > lime need. We can meet entire Mg need without exceeding lime amount
            // MARK: -Part 1B meet all Mg w/ Dolomite-
            explanationArray.append(String(format: "We can meet entire Mg need (%.2f lbs/acre) with Dolomite lime without exceeding total lime need. Add %.2f lbs/acre Dolomite Lime, which is 19 percent Mg & 22 percent Ca. Add %.2f lbs/acre Calcium Carbonate lime (38 percent Ca) to meet the rest of lime need.",magnesiumN,magnesiumN/0.19,lime-magnesiumN/0.19))
            recommendationArray.append(String(format: "Add %.0f lbs/acre Dolomite lime",magnesiumN/0.19))
            recommendationArray.append(String(format: "Add %.0f lbs/acre Calcium Carbonate lime",lime-magnesiumN/0.19))
            
//            CalciumExplain += String(format: "Calcium analysis: \nThe Ca need is %.0f lbs/acre. From above, the Dolomite lime added is 22 percent Ca, which gives %.0f lbs/acre. From above, the Calcium Carbonate lime added is 38 percent Ca, which gives %.0f lbs/acre Ca.",calciumN, 0.22 * magnesiumN/0.19,0.38 * (lime-magnesiumN/0.19))
            
            // dolomite is 22% Ca. CaCO3 is 38% Calcium
            calciumN  -= (magnesiumN/0.19) * 0.22// decrement calcium for Dolomite
            calciumN  -= (lime-magnesiumN/0.19) * 0.38// decrement calcium for Calcium Carbonate
            magnesiumN = 0 // decrement magneium need
            
            // cost - add dolomite
            // cost - add Calcium carbonate
            
            
            
        }
        else if lime>=0{       // Meeting entire Mg with dolomite would exceed lime need. Meet part with dolomite, part with Mg Sulphate
            // MARK: -Part 1a can't meet all Mg w/ Dolomite-
            explanationArray.append(String(format: "Magnesium analysis: \nIf we met entire Mg need (%.2f lbs/acre) with Dolomite lime, that would exceed the total lime needed to balance pH. Meet part of the Mg need and the entire pH need with %.0f lbs/acre Dolomite Lime.  Dolomite Lime is 19 percent Mg which gives %.0f lbs/acre Mg. Meet the remaining Mg need with %.2f lbs/acre Magnesium Sulfate, which does not change pH. Magnesium Sulfate is 9.8 percent Mg which gives the remaining %.0f lbs/acre Mg.",magnesiumN,lime,lime*0.19, (magnesiumN-lime*0.19)/0.098,magnesiumN-lime*0.19))
            
            recommendationArray.append(String(format: "Add %.0f lbs/acre Dolomite Lime",lime*0.19))
            
            recommendationArray.append(String(format: "Add  %.0f lbs/acre Magnesium Sulfate",(magnesiumN-lime*0.19)/0.098))
            
//            CalciumExplain.append(String(format: "The Ca need is %.0f lbs/acre. From above, the %.0f lbs/acre Dolomite lime added is 22 percent Ca, which gives %.0f lbs/acre of Ca. ",calciumN, lime,  0.22 * magnesiumN/0.19))
            
            calciumN  -= lime * 0.22// decrement calcium for Dolomite
            magnesiumN = 0 // decrement magneium need
            
            // cost - add dolomite
            // cost - add Magnesium Sulfate
            
            
        }
    }
    


    // MARK: -Decision 2: Has Mg been met?
    if magnesiumN>0{       // Still have unmet Mg need
        // MARK: -Part 1a can't meet all Mg w/ Dolomite-
        explanationArray.append(String(format: "The Mg need is still %.2f lbs/acre, meet that with %.2f lbs/acre Magnesium Sulfate, which is 9.8 percent Mg.",magnesiumN,magnesiumN/0.098))
        
        recommendationArray.append(String(format: "Add  %.0f lbs/acre Magnesium Sulfate",magnesiumN/0.098))
        
        magnesiumN = 0 // decrement magneium need
        
        // cost - add Magnesium Sulfate
        
        
    }
    

    // MARK: -Decision 3: Has Ca been met?

    if calciumN > 0 {
        explanationArray.append(String(format: "Meet remaining Calcium need with %.0f lbs/acre Gypsum, which is 23 percent Calcium and does not affect pH",calciumN/0.23))
        recommendationArray.append(String(format: "Add %.0f lbs/acre Gypsum",calciumN/0.23))
       
        // update Calcium explanation
        // cost - add gypsum
    }


    
    
    // MARK: -Part 3 NPK-
    explanationArray.append(String(format: "Nitrogen: %.0f lbs \(nitrogenType) per acre", nitrogen))
    recommendationArray.append(String(format: "Add %.0f lbs/acre \(nitrogenType)",nitrogen))

    explanationArray.append(String(format: "Phosphorus: %.0f lbs P2O5 per acre", lbsP2O5))
    if lbsP2O5 > 0
    {
        recommendationArray.append(String(format: "Add %.0f lbs P2O5 per acre",lbsP2O5))
    }

    explanationArray.append(String(format: "Potassium: %.0f lbs K2O per acre", lbsK2O))
    if lbsK2O > 0
    {
        recommendationArray.append(String(format: "Add %.0f lbs/acre K2O",lbsK2O))
    }

    

    explanationArray.append("Total Cost will be calculated in the future: $\(String(format: "%.2f", totalCost))")
    return (totalCost, explanationArray, recommendationArray)
}
//// Example usage:
//let (cost, text) = calculateCostAndText(pH: 7.2, phosphorus: 0.5, potassium: 0.8, magnesium: 0.4, calcium: 0.6)
//print("Total Cost: $\(cost)")
//print("Text Array:")
//for line in text {
//    print(line)
//}
// VStack, LEAD = Rayaan
struct FERT_DETAILS: View {
    @ObservedObject var tinyPile: PileOfRubbish
    let crop: PileOfRubbish.CropData
    var body: some View {
        var soilType="heavy"

        // all vars must be declaired inside "body"
        let (cost, textExplanation, textRecommendation) = calculateCostAndText(pH: tinyPile.pH, phNeed: crop.cropPH, phosphorus: tinyPile.phosphorus, potassium: tinyPile.potassium, magnesium: tinyPile.magnesium, tinyPile: tinyPile, soilType: soilType, calcium: tinyPile.calcium)
       

        Form {
            Section(header: Text("Fertilizer recommendation for \(crop.cropName)")) {
                List(textRecommendation, id: \.self) { line in
                    Text(line)
                }
            }
            Section(header: Text("More info on calculations")) {
                List(textExplanation, id: \.self) { line in
                    Text(line)
                }
            }
        }
        .navigationTitle("\(crop.cropName)")


    }
};

#Preview {
    ContentView()
}
