//
//  PieView.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/3/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct PieView: View {
    var data: [DataItem]
    var title: String
    var subTitle: String? = ""
    var legend:Bool
    
    init(data: [DataItem],title: String, legend: Bool = false){
        self.title = title
        self.data = data
        self.legend = legend
    }
    
    var body: some View {
        VStack {
            Text(title).font(.headline)
            HStack {
                PieChart(pieChartData: PieChartData(data: data))
                    .frame(width: 180, height: 180)
                if legend {
                    LegendView(legend: LegendData(items: data.map{(title:$0.title, subTitle: $0.subTitle , value: $0.value, color: $0.color )})).frame(width: 200, height: 180)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct PieView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PieView(data: [DataItem(title: "test", value: 0, color: .green)], title: "Testing")
            PieView(data: [DataItem(title: "test", value: 24.0, subTitle: "+ \(222.withCommas())", color: .red)], title: "testing", legend: true)
        }
    }
}
