//
//  SavedTowardsDebtView.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/21/23.
//
import CoreData
import SwiftUI

struct SavedTowardsDebtView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let saveditem : SavedItem
    let debtitem : DebtItem
    
    
    
    @State private var amount: Double = 0
    
    
    var body: some View {
        //var debtitem2:DebtItem
        Text(saveditem.name ?? "SAVED UNK")
        Text(debtitem.name ?? "DEBT UNKO")
        Text(debtitem.id?.uuidString ?? "no id")
        //Text("credit = " + String(itemsofcreditcard.count))
        Text(debtitem.amount?.subtracting(saveditem.amount ?? NSDecimalNumber(value: 0.0)).stringValue ?? "error")
        //Text()
        Button {
            debtitem.amount = debtitem.amount?.subtracting(saveditem.amount ?? NSDecimalNumber(value: 0.0))
            saveditem.used = true
            saveditem.puttowards = debtitem.id
            NSLog("DEBT ID = " + String(debtitem.id?.uuidString ?? "NOUUID"))
            NSLog("SAVED ID = " + String(saveditem.puttowards?.uuidString ?? "NOUUID"))
            try? viewContext.save()
        } label: {
            Text("do it")
        }


    }
}

//struct SavedTowardsDebtView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedTowardsDebtView()
//    }
//}
