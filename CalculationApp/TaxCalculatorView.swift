//
//  TaxCalculatorView.swift
//  CalculationApp
//
//  Created by natsuko mizuno on 2024/05/14.
//

import SwiftUI

struct TaxCalculatorView: View {
    
    @State var withoutTax: String = "" //税抜き金額
    @State var taxIncluded: Int = 0 // 計算結果を保持する
    
    // 税率8％の計算をする
    func calculateTax8Percent() {
        if let withoutTaxNum = Double(withoutTax) {
            let result = Int(withoutTaxNum * 1.08)
            taxIncluded = result
        } else {
            taxIncluded = -1
        }
    }
    
    // 税率10％の計算をする
    func calculateTax10Percent() {
        if let withoutTaxNum = Double(withoutTax) {
            let result = Int(withoutTaxNum * 1.1)
            taxIncluded = result
        } else {
            taxIncluded = -1
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.55, green: 0.9, blue: 0.9, opacity: 0.6)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "percent")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 110.0, height: 110.0)
                    .padding(.bottom,100.0)
                    .foregroundColor(.blue)
                
                Text("税込金額を計算します")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("税抜：").padding(.horizontal, 0)
                    TextField("0", text: $withoutTax)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 100)
                    
                    Button(action: {
                        withoutTax = ""
                        taxIncluded = 0
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 15.0, height: 15.0)
                            .foregroundColor(.red)
                    })
                } // HStack
                .frame(width: 200)
                .padding()
                
                
                
                HStack {
                    Button(action: {
                        calculateTax8Percent()
                    }, label: {
                        Text("8%")
                    })
                    .buttonStyle(RoundedButtonStyle())
                    
                    Button(action: {
                        calculateTax10Percent()
                    }, label: {
                        Text("10%")
                    })
                    .buttonStyle(RoundedButtonStyle())
                    
                } // HStack
                .padding()
                
                if (taxIncluded == -1) {
                    Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal,0)
                } else {
                    Text("税込：\(taxIncluded)円")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal,0)
                }
                
                    
                
            } // VStack
            
        } //ZStack
        
    } // body
} // TaxCalculatorView

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(7)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

#Preview {
    TaxCalculatorView()
}

