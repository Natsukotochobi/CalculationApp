//
//  UnitPriceCalculatorView.swift
//  CalculationApp
//
//  Created by natsuko mizuno on 2024/05/10.
//

import SwiftUI

struct UnitPriceCalculatorView: View {
    
    @State var totalPrice: String = "" //合計金額
    @State var quantity: String = "" //何個入りか
    
    func unitPrice() -> Int {
        if let totalPriceNum = Double(totalPrice),
           let quantityNum = Double(quantity) {
            let result = Int(totalPriceNum / quantityNum)
            return result
        } else {
            return -1
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.75, green: 1.0, blue: 0.8, opacity: 0.6)
                .ignoresSafeArea()
            
            VStack {
                
                Image(systemName: "cart")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 120.0, height: 120.0)
                    .padding(.bottom,100.0)
                    .foregroundColor(.green)
                
                Text("単価計算します")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("合計金額：").padding(.horizontal, 0)
                    TextField("0", text: $totalPrice)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 100)
                        
                } // HStack
                .frame(width: 200)
                
                HStack {
                    Text("個数：").padding(.horizontal,0)
                    TextField("0", text: $quantity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        
                } // HStack
                .frame(width: 200)
                .padding()
                
                Text("1個：\(unitPrice())円")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal,0)
                
            } // VStack
           
        } //ZStack
        
    } // body
            
  
    
} // UnitPriceCalculatorView

#Preview {
    UnitPriceCalculatorView()
}
