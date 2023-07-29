//
//  SavedItemDetail.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/18/23.
//

import SwiftUI

struct SavedItemDetail: View {
    let saveditem : SavedItem
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DebtItem.datedue, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<DebtItem>
    
    var body: some View {
        VStack{
            Text(saveditem.name ?? "blank")
            Text(saveditem.amount?.stringValue ?? "0.00")
            var savededit = addsome(newnum: saveditem.amount ?? 0.00)
            Text(savededit.stringValue)
            
            List {
                Section{
                    ForEach(items){debtitem in
                        NavigationLink{
                            SavedTowardsDebtView(saveditem: saveditem, debtitem: debtitem)
                        }label:{
                            VStack{
                                Text(debtitem.name ?? "UNKN")
                                    .font(.headline)
                                let numberCurrFormatter: NumberFormatter = {
                                    let formatter = NumberFormatter()
                                    formatter.maximumFractionDigits = 2
                                    return formatter
                                }()
                                var curramtdebt = debtitem.amount?.dividing(by: 100)
                                var amtdebt = numberCurrFormatter.string(from:Double(truncating: curramtdebt ?? 2.22) as NSNumber)
                                Text("$" + (amtdebt ?? "ghfhg"))
                            }
                        }
                        
                    }
                }header: {
                    Text("Pick Debt to put saved towards")
                }
            }
            Text("Tiny")
        }
    }
}

func addsome(newnum : NSDecimalNumber) -> NSDecimalNumber {
    return newnum.adding(2.01)
}
//struct SavedItemDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedItemDetail()
//    }
//}
