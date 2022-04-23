//
//  ContentView.swift
//  WeSplitSwiftUIBootcamp
//
//  Created by Le Minh Khanh on 23/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentgae = 20
    @FocusState private var amountIsFocused: Bool
    
    let currency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    let tipPercentages = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 0]
    
    var grandTotal: Double {
        let tipSelected = Double(tipPercentgae)
        let tipValue = checkAmount / 100 * tipSelected
        let total = checkAmount + tipValue
        
        return total
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Amount:")
                        TextField("Amount", value: $checkAmount, format: currency)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    } //: HSTACK
                    
                    Picker("Number of people:", selection: $numberOfPeople, content: {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }) //: PICKER
                } //: SECTION
                
                Section {
                    Picker("Tip percentage:", selection: $tipPercentgae, content: {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
//                        ForEach(0 ... 100) {
//                            Text($0, format: .percent)
//                        }
                    })
                    .pickerStyle(.wheel)
                    //.pickerStyle(.inline)
                    
                } header: {
                    Text("How much tip do you want to leave?")
                        .fontWeight(.heavy)
                }//: SECTION
                
                Section {
                    Text(grandTotal, format: currency)
                } header: {
                    Text("Total Amount:")
                        .fontWeight(.heavy)
                }
                
                Section {
                    Text(totalPerPerson, format: currency)
                } header: {
                    Text("Amount per person:")
                        .fontWeight(.heavy)
                }
            } //: FORM
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button(action: {
                        amountIsFocused = false
                    }, label: {
                        Text("Done")
                            .padding(.horizontal)
                            .foregroundColor(Color.yellow)
                            .background(Color.blue)
                            .cornerRadius(4.0)
                    })
                }
            } //: TOOLBAR
        } //: NAVIGATIONVIEW
    } //: BODY
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
