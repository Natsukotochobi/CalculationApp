//
//  ContentView.swift
//  CalculationApp
//
//  Created by natsuko mizuno on 2024/05/10.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
    @FocusState var isInputActive: Bool
    
    var body: some View {
        TabView(selection: $selection) {
            
            TaxCalculatorView()
                .tabItem {
                    Label("税金計算", systemImage: "percent")
                }.tag(1)
                .focused($isInputActive)
            
            UnitPriceCalculatorView()
                .tabItem {
                    Label("単価計算", systemImage: "cart")
                }.tag(2)
                .focused($isInputActive)
        } // TabView
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                }
            }
        } // toolbar
    } // body閉じる
} // ContentView閉じる

#Preview {
    ContentView()
}
