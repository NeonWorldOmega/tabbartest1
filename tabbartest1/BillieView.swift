//
//  BillieView.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/9/23.
//

import SwiftUI

struct BillieView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DebtItem.datedue, ascending: true)],
        animation: .default)
    private var items: FetchedResults<DebtItem>
    @State private var showingAddDebtScreen = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(items){debtitem in
                    NavigationLink{
                        DebtDetailView(debtitem:debtitem)
                    }label:{
                        VStack(alignment:.leading){
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
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingAddDebtScreen.toggle()
                    }label: {
                        Label("hi", systemImage: "plus")
                    }
                }
            }.navigationTitle("Add Debt")
                .sheet(isPresented: $showingAddDebtScreen){
                    DebtItemForm()
                }
        }
    }
}

struct BillieView_Previews: PreviewProvider {
    static var previews: some View {
        BillieView()
    }
}
