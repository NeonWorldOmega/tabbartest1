//
//  DebtDetailView.swift
//  tabbartest1
//
//  Created by Brandon Fink on 8/3/23.
//

import SwiftUI


struct DebtDetailView: View {

    let debtitem : DebtItem
    @Environment(\.managedObjectContext) private var viewContext

    //private var items: FetchedResults<SavedItem>

    //nit(debtitem: DebtItem) {
    //    self.debtitem = debtitem
    //}
    
    var body: some View {
        Form{
            Section{
                VStack{
                    Text(debtitem.name ?? "blank")
                    Text(debtitem.amount?.stringValue ?? "0.00")
                    ProgressView(value: 0.66){
                        Text("66%")
                    }
                    
                }

            }
            Section{
                SavedPutTowardsListView(filter: String(debtitem.id!.uuidString))
            }header: {
                Text("Pick Debt to put saved towards")
            }

        }

    }
}

//struct DebtDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DebtDetailView()
//    }
//}
