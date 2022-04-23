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
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                } //: SECTION
            } //: FORM
            .navigationTitle("WeSplit")
        } //: NAVIGATIONVIEW
    } //: BODY
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
