//
//  ContentView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 4/29/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
//    @State var items:Regions?
    @State var items:[(name: String, country: Country)] = []
    @State var updatedAt: String = DateFormatter().string(from: Date())
    var body: some View {
        
        VStack{
            HeaderView()
            
            List{
            ForEach(0..<items.count, id: \.self){ index in
                ListSectionView(totals: self.items[index].country.totals, title: self.items[index].name)
                }
            }
            Spacer()
        }.onAppear(perform: DataRequest(items: $items).loadData)
            .onTapGesture(count: 2, perform: DataRequest(items: $items).loadData)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .environment(\.colorScheme, .dark)
                .background(Color(UIColor.black))
        }
    }
}


