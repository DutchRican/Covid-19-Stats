//
//  ContentView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 4/29/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var items:[(name: String, country: Country)] = []
    @State var updatedAt: String = DateFormatter().string(from: Date())
    var body: some View {
        VStack{
            HeaderView()
            NavigationView {
                List{
                    ForEach(items, id: \.self.name) {(name, country) in
                        Section(header: Text("\(name)")){
                            NavigationLink(destination: CountryListView(items: country.list ?? [])) {
                                PieView(data: dataArray(totals: country.totals), title: "\((country.totals?.confirmed ?? 0).withCommas()) confirmed cases", legend: true)
                                    .padding(.bottom)
                            }
                        }
                    }
                }
            }
            
            Spacer()
        }.onAppear(perform: DataRequest(items: $items).loadData)
            .onTapGesture(count: 2, perform: DataRequest(items: $items).loadData)
    }
}

let test_items:[(name: String, Country)] = [(name: "Test", Country( totals: Totals(confirmed: 34, daily_confirmed: 1, daily_deaths: 2, deaths: 10, tests: 33, recovered: 10, critical: -1), list: [CountryTotals(state: "Anguilla", country: "United Kingdom", confirmed: 3, daily_confirmed: 1, daily_deaths: 2, deaths: 2, tests: 44, recovered: 23, critical: 3, last_updated: "2020-05-02T02:32:27", country_code: "ai")])),(name: "Test2", Country(totals: Totals(confirmed: 34, daily_confirmed: 1, daily_deaths: 2, deaths: 10, tests: 33, recovered: 10, critical: 5), list: [CountryTotals(state: "Anguilla", country: "United Kingdom", confirmed: 3, daily_confirmed: 1, daily_deaths: 2, deaths: 2, tests: 44, recovered: 23, critical: -1, last_updated: "2020-05-02T02:32:27", country_code: "ai")]))]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(items:test_items)
            ContentView(items:test_items)
                .environment(\.colorScheme, .dark)
                .background(Color(UIColor.black))
        }
    }
}


