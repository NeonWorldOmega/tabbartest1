//
//  LordeView.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/9/23.
//

import SwiftUI

struct LordeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedItem.timestamp, ascending: true)],
        predicate: NSPredicate(format: "used == false"),
        animation: .default)
    private var items: FetchedResults<SavedItem>
    @State private var showingAddSaveScreen = false

    var body: some View {
        NavigationView {
            List{
                ForEach(items){saveditem in
                    NavigationLink{
                        SavedItemDetail(saveditem: saveditem)
                    } label:{
                        VStack(alignment:.leading){
                            Text(saveditem.name ?? "UNKNOWN")
                                .font(.headline)
                            let numberCurrFormatter: NumberFormatter = {
                                let formatter = NumberFormatter()
                                formatter.maximumFractionDigits = 2
                                return formatter
                            }()
                            let curramtsaved = saveditem.amount?.dividing(by: 100)
                            let amtsaved = numberCurrFormatter.string(from:Double(truncating: curramtsaved ?? 2.22) as NSNumber)
                            Text("$" + (amtsaved ?? "ghfhg"))
                        }
                    }
                }
            }
            .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            showingAddSaveScreen.toggle()
                        }label: {
                            Label("hi", systemImage: "plus")
                        }
                    }
                }
                .navigationTitle("Saved Items")
                .sheet(isPresented: $showingAddSaveScreen){
                    SavedCashItemForm()
                }
        }
    }
}

func convertamount(amt : NSDecimalNumber) -> NSDecimalNumber {
    var newnum = NSDecimalNumber(value: 0)
    newnum = amt.multiplying(by: 100)
    return newnum
}

struct LordeView_Previews: PreviewProvider {
    static var previews: some View {
        LordeView()
    }
}
