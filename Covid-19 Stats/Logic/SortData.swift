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
    
    data.append(DataItem(title: "Active", value:Double(safeTotals.confirmed - safeTotals.deaths - safeTotals.recovered), subTitle: "+ \(safeTotals.daily_confirmed.withCommas())" , color: .yellow))
    data.append(DataItem(title: "Deaths", value: Double(safeTotals.deaths), subTitle: "+ \(safeTotals.daily_deaths.withCommas())", color: .red))
    data.append(DataItem(title: "Recovered", value: Double(safeTotals.recovered), color: .green))
    data.append(DataItem(title: "Critical", value: Double(safeTotals.critical), color: .orange))
    return data
}
