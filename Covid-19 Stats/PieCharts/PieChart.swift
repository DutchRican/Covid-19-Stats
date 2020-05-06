//
//  PieChart.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/3/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

struct PieChart: View {
    var pieChartData: PieChartData
    var body: some View {
        GeometryReader { geometry in
            self.makePieChart(geometry, pieChartData: self.pieChartData.data)
        }
    }
    
    func makePieChart(_ geometry: GeometryProxy, pieChartData: [SlideData]) -> some View {
        let chartSize = min(geometry.size.width, geometry.size.height)
        let radius = chartSize / 2
        
        return ZStack {
            ForEach(0..<pieChartData.count, id: \.self) { index in
                PieChartSlide(geometry: geometry, slideData: pieChartData[index], index: index)
            }
            ForEach(pieChartData) { slideData in
                Text("\(slideData.percentage)%")
                    .foregroundColor(Color.white)
                    .position(slideData.centerPos(radius: radius))
                    .font(.caption)
            }
        }
        
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(pieChartData: PieChartData(data: [DataItem(title:"first", value: 20.0, color: nil),DataItem(title: "second", value: 12.0, color: .green),DataItem(title: "third", value: 5.0, color: .red)]))
    }
}
