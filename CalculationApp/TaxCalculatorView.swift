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
    @State var errorMessage: String? = nil // 入力値が不正な場合のエラーメッセージを保持する
    
    // 入力値が不正でないか判定
    func isValidInput(_ input: String) -> Bool {
        if let withoutTaxNum = Double(input), withoutTaxNum > 0 {
            return true
        }
        return false
    }
    
    // 税率を引数で受け取って計算をする
    func calculateTax(_ rate: Double) {
        guard isValidInput(withoutTax) else {
            errorMessage = "1以上の数を入力して下さい"
            withoutTax = ""
            return
        }
        if let withoutTaxNum = Double(withoutTax) {
            let result = Int(withoutTaxNum * rate)
            taxIncluded = result
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
                    .padding(.bottom, 70.0)
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
                        errorMessage = nil
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
                        errorMessage = nil
                        calculateTax(1.08)
                    }, label: {
                        Text("8%")
                    })
                    .buttonStyle(RoundedButtonStyle())
                    
                    Button(action: {
                        errorMessage = nil
                        calculateTax(1.10)
                    }, label: {
                        Text("10%")
                    })
                    .buttonStyle(RoundedButtonStyle())
                    
                } // HStack
                .padding()
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .font(.title3)
                        .padding(.horizontal,0)
                        .foregroundColor(.red)
                    
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

