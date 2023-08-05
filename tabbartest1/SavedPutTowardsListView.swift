//
//  SavedPutTowardsListView.swift
//  tabbartest1
//
//  Created by Brandon Fink on 8/4/23.
//

import SwiftUI

struct SavedPutTowardsListView: View {
    @FetchRequest var fetchRequest: FetchedResults<SavedItem>
    
    var body: some View {
        List(fetchRequest,id: \.self){ usedsitem in
            VStack{
                Text(usedsitem.name ?? "Unkown")
                Text(usedsitem.amount?.stringValue ?? "0.00")
            }
        }
        
    }
    
    init(filter: String){
        _fetchRequest = FetchRequest<SavedItem>(sortDescriptors: [],predicate: NSPredicate(format: "puttowards == %@",filter))
    }
}

//struct SavedPutTowardsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedPutTowardsListView()
//    }
//}
