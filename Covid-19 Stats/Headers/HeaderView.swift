//
//  HeaderView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/3/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
      @Binding var items:[(name: String, country: Country)]
      @Binding var isLoading:Bool
    
    var body: some View {
        VStack {
            Text("Covid Stats")
                .font(.system(size: 50))
                .fontWeight(.semibold)
                .foregroundColor(Color("TitleColor"))
                
            Text("Updated from cov19.cc")
        }
        .padding()
        .onTapGesture(count: 2, perform: {DataRequest(items: self.$items, isLoading: self.$isLoading).loadData()
            self.isLoading = true
        })
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(items: .constant([]), isLoading: .constant(false))
    }
}
