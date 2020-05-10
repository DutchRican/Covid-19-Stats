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
        print(title)
        return Section(header:Text(title)){
            PieView(data: dataArray(totals: totals), title: "\((totals?.confirmed ?? 0).withCommas()) confirmed cases", legend: true)
                .padding(.bottom)
        }
    }
}

struct ListSectionView_Previews: PreviewProvider {
    static var previews: some View {
        List{
        ListSectionView(totals: nil, title:"test" )
        ListSectionView(totals: Totals(confirmed: 50, daily_confirmed: 20, daily_deaths: 10, deaths: 1, tests: 44, recovered: 32, critical: 0), title: "Testing")
        }
    }
}
