//
//  CountryListView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/9/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct CountryListView: View {
    var items: [CountryTotals]
    @State var filter: String = ""
    
    var body: some View {
        VStack{
            List{
                SearchView(filter: $filter)
                ForEach(filteredItems(items: items.sorted{$0.confirmed > $1.confirmed}, filter: filter)){ item in
                ListSectionView(totals: Totals(confirmed: item.confirmed, daily_confirmed: item.daily_confirmed, daily_deaths: item.daily_deaths, deaths: item.deaths, tests: item.tests, recovered: item.recovered, critical: item.critical), title: item.state ?? item.country)
                }
            }
            Spacer()
        }
    }
}

func filteredItems(items: [CountryTotals], filter: String) -> [CountryTotals] {
    if filter.isEmpty {return items}
    return items.filter{ $0.country.contains(filter) || ($0.state ?? "").contains(filter) }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView(items: [
            CountryTotals(state: "Anguilla", country: "United Kingdom", confirmed: 3 , daily_confirmed: -1, daily_deaths: -1, deaths: -1, tests: -1, recovered: 3, critical: -1, last_updated: "2020-05-02T02:32:27", country_code: "ai")
        ])
    }
}
