//
//  CheckoutView.swift
//  BookStore
//
//  Created by shahadmufleh on 18/01/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Credit Card"]
    let tipAmounts = [0, 10, 15, 20]
    @State private var paymentType = "Cash"
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)

        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }

    
    
    
    
    
    var body: some View {
    
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
            }
            
                Section(header: Text("Add a tip?")) {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                
            }
                    Section(header:
                        Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)
                    ){
                        Button("Confirm order") {
                            showingPaymentAlert.toggle()
                        }
                        
                        
                        
                    }
                    
                .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showingPaymentAlert) {
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
            }
                }
                .pickerStyle(SegmentedPickerStyle())
    }
}
}
}
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraSmall)
            .environmentObject(Order())
    }
}
