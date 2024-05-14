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
            Text("ホーム")
                .tabItem {
                    Label("HOME", systemImage: "house")
                }.tag(1)
            
            UnitPriceCalculatorView()
                .tabItem {
                    Label("単価計算", systemImage: "sun.max")
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
