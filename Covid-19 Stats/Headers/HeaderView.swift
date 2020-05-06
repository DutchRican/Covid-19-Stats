//
//  HeaderView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/3/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
//            Image("Title")
//                .resizable()
//                .scaledToFit()
            Text("Covid Stats")
                .font(.system(size: 50))
                .fontWeight(.semibold)
                .foregroundColor(Color("TitleColor"))
                
            Text("Updated from cov19.cc")
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
