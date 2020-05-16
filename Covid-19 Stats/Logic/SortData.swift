//
//  SortData.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/5/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import Foundation


func dataArray(totals: Totals?) -> [DataItem] {
    var data:[DataItem] = []
    guard let safeTotals = totals else {return data}
    let deaths = safeTotals.deaths >= 0 ? safeTotals.deaths : 0
     let recovered = safeTotals.recovered >= 0 ? safeTotals.recovered : 0
    let critical = safeTotals.critical >= 0 ? safeTotals.critical : 0
    let confirmed = safeTotals.confirmed >= 0 ? safeTotals.confirmed : 0
    data.append(DataItem(title: "Active", value:Double(confirmed - deaths - recovered), subTitle: safeTotals.daily_confirmed > 0 ?  "+ \(safeTotals.daily_confirmed.withCommas())" : "", color: .yellow))
    data.append(DataItem(title: "Deaths", value: Double(deaths), subTitle: safeTotals.daily_deaths > 0 ? "+ \(safeTotals.daily_deaths.withCommas())" : "", color: .red))
    data.append(DataItem(title: "Recovered", value: Double(recovered), color: .green))
    data.append(DataItem(title: "Critical", value: Double(critical), color: .orange))
    return data
}
