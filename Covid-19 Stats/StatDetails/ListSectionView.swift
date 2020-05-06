//
//  SectionView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/5/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct ListSectionView: View {
    var totals: Totals?
    var title: String
    var body: some View {
        Section(header:Text(title)){
            PieView(data: dataArray(totals: totals), title: "\((totals?.confirmed ?? 0).withCommas()) confirmed cases", legend: true)
                .padding(.bottom)
        }
    }
}

struct ListSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ListSectionView(totals: nil, title:"test" )
    }
}
