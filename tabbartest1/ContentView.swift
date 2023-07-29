//
//  ContentView.swift
//  tabbartest1
//
//  Created by Brandon Fink on 7/9/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavedItem.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<SavedItem>
    
    
    var body: some View {

            TabView{
                LordeView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Saved")
                    
                        
                    }
                U2View()
                    .tabItem {
                        Image(systemName: "bolt")
                        Text("U2")
                        
                    }
                BillieView()
                    .tabItem {
                        Image(systemName: "camera")
                        Text("Debt")
                    }
                
            }
            
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon.font(.headline)
            configuration.title.font(.subheadline)
        }
    }
}
