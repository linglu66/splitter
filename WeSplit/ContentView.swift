//
//  ContentView.swift
//  WeSplit
//
//  Created by Design Work on 2020-08-12.
//  Copyright © 2020 Ling Lu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numPeople = ""
    @State private var tipPercent = 2
    private var totalPerPerson: Double {
        
        
        let peopleCount = Double(numPeople) ?? 0 + 2
        let tipSelection = Double(tipPercents[tipPercent])
        let checkDouble = Double(checkAmount) ?? 0
        return checkDouble*(1+tipSelection/100)/peopleCount
    }
    private var totalAmount: Double{
        let peopleCount = Double(numPeople) ?? 0 + 2
        return totalPerPerson*peopleCount
    }
    let tipPercents = [0,10,15,20,25]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    
                    TextField("Number of Guests",  text: $numPeople).keyboardType(.numberPad)
                        
                    
//                    Picker("Number of Guests",selection: $numPeople) {
//                        ForEach(2 ..< 99 ){
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How much tip would you like to leave?")){
                    
                    Picker("Tip Percent",selection:$tipPercent){
                        ForEach(0..<tipPercents.count){
                            Text("\(self.tipPercents[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total amount for the check")){
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(tipPercent==0 ? .red : .black)
                }
                Section(header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle(Text("WeSplit"))
        }

        
//        VStack{
//            Picker("Select your dog", selection: $selectedDog){
//                ForEach(0..<self.dogs.count){
//                    Text(self.dogs[$0])
//                }
//            }
//            Text("You selected \(dogs[selectedDog])")
//        }
//        Form{
//            Button("Tap count \(tapCount)"){
//                self.tapCount += 1
//            }
//            Button("Tap count \(tapCount)"){
//                self.tapCount += 1
//            }
//            Text("Hello \(name)")
//            TextField("What is your name?", text: $name)
//            ForEach (0..<5){ number in
//                Text("Number \(number)")
//            }
//
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
