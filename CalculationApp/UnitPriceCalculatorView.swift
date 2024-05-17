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
    @State var unitPrice: Int = 0 // 計算結果を保持する
    @State private var errorMessage: String? = nil //入力値が不正な場合のエラーメッセージを保持
    
    // 入力値が不正でないか判定
    func isValidInput(inputTotalPrice: String, inputQuantity: String) -> Bool {
        if let totalPriceNum = Double(inputTotalPrice), totalPriceNum > 0,
           let quantityNum = Double(inputQuantity), quantityNum > 0 {
            return true
        }
        return false
    }
    
    // 単価を計算する
    func calculateUnitPrice() {
        guard isValidInput(inputTotalPrice: totalPrice, inputQuantity: quantity) else {
            errorMessage = "合計金額と個数は0より大きい値を入力してください"
            totalPrice = ""
            quantity = ""
            return
        }
        if let totalPriceNum = Double(totalPrice),
           let quantityNum = Double(quantity) {
            let result = Int(totalPriceNum / quantityNum)
            unitPrice = result
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
                    .padding(.bottom, 70.0)
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
                
                Button(action: {
                    totalPrice = ""
                    quantity = ""
                    unitPrice = 0
                    errorMessage = nil
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 15.0, height: 15.0)
                        .foregroundColor(.red)
                })
                
                Button(action: {
                    errorMessage = nil
                    calculateUnitPrice()
                }, label: {
                    Text("計算する")
                })
                .buttonStyle(RoundedButtonStyle())
                .padding()
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .font(.title3)
                        .padding(.horizontal,0)
                        .foregroundColor(.red)
                } else {
                    Text("1個：\(unitPrice)円")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal,0)
                }
                
            } // VStack
           
        } //ZStack
        
    } // body
            
  
    
} // UnitPriceCalculatorView

#Preview {
    UnitPriceCalculatorView()
}
