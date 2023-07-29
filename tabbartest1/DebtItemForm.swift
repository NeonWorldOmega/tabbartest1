//
//  DebtItemForm.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/14/23.
//

import SwiftUI

struct DebtItemForm: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @State private var amount = 0.0
    @State private var timestamp = Date(timeIntervalSinceNow: 0)
    @State private var name =  ""
    @State private var id = UUID()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of debt item", text: $name)
                    Text("Created on " + timestamp.formatted())
                    TextField("Enter amount", value: $amount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }header: {
                    Text("Enter Item Details")
                }
                Section {
                    Button("Save Debt"){
                        let newSaved = DebtItem(context: viewContext)
                        newSaved.id = UUID()
                        amount = amount * 100
                        newSaved.amount = NSDecimalNumber(mantissa: UInt64(amount), exponent: 0, isNegative: false)
                        newSaved.name = name
                        newSaved.datedue = timestamp
                        try? viewContext.save()
                        dismiss()
                    }
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Debt Item")
            
        }
    }
}

struct DebtItemForm_Previews: PreviewProvider {
    static var previews: some View {
        DebtItemForm()
    }
}
