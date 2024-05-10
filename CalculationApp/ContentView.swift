//
//  ContentView.swift
//  CalculationApp
//
//  Created by natsuko mizuno on 2024/05/10.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 1
    
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
        }
    } // body閉じる
} // ContentView閉じる

#Preview {
    ContentView()
}
