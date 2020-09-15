//
//  SearchView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/16/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var filter: String
    var body: some View {
        HStack {
            Text("Filter results: ")
                .font(.system(size: 20)).bold()
            TextField("Example: Global", text: $filter).foregroundColor(.blue).font(.system(size: 20))
            Image(systemName: "clear")
                .resizable().frame(width: 20, height: 20)
                .onTapGesture {
                    self.filter = ""
            }
        }
        .padding([.leading, .trailing])
        .frame(height: 40)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(filter: .constant("test"))
    }
}
