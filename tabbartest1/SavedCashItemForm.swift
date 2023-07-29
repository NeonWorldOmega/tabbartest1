//
//  SavedCashItemForm.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/14/23.
//

import SwiftUI

struct SavedCashItemForm: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @State private var amount = 0.0
    @State private var timestamp = Date(timeIntervalSinceNow: 0)
    @State private var name =  ""
    @State private var id = UUID()
    @State private var used = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of saved item", text: $name)
                    Text("Created on " + timestamp.formatted())
                    let numberCurrFormatter: NumberFormatter = {
                        let formatter = NumberFormatter()
                        //formatter.generatesDecimalNumbers = true
                        return formatter
                    }()
                    TextField("Enter amount", value: $amount, formatter: numberCurrFormatter)
                        .keyboardType(.decimalPad)
                }header: {
                    Text("Enter Item Details")
                }
                Section {
                    Button("Save Item"){
                        let newSaved = SavedItem(context: viewContext)
                        let curFmt = NumberFormatter()
                        curFmt.generatesDecimalNumbers = true
                        curFmt.numberStyle = .currency
                        
                        newSaved.id = UUID()
                        //kinda worked newSaved.amount = NSDecimalNumber(decimal: Decimal(amount))
                        amount = amount * 100
                        newSaved.amount = NSDecimalNumber(mantissa: UInt64(amount), exponent: 0, isNegative: false)
                        NSLog("\(newSaved.amount ?? 0.09)")
                        newSaved.name = name
                        newSaved.timestamp = timestamp
                        newSaved.used = used
                        try? viewContext.save()
                        dismiss()
                    }
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Saved Cash Item")
            
        }
    }
}

struct SavedCashItemForm_Previews: PreviewProvider {
    static var previews: some View {
        SavedCashItemForm()
    }
}
