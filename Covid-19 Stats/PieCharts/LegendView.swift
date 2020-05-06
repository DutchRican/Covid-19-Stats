//
//  LegendView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/4/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct LegendView: View {
    var legend:LegendData
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<legend.items.count, id: \.self) { index in
                HStack {
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(self.legend.items[index].color)
                    VStack (alignment: .leading){
                        Text(self.legend.items[index].title)
                        Text(self.legend.items[index].value.withCommas()).font(.caption)
                    }
                }
                
            }
        }
    }
}

struct LegendView_Previews: PreviewProvider {
    static var previews: some View {
        LegendView(legend: LegendData(items: [(title: "test1", value: 249.0, color: Color.red), (title: "here we are", value: 522.0, color: Color.green)]))
    }
}
