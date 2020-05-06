//
//  PieChartData.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/3/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import Foundation
import SwiftUI

class PieChartData: ObservableObject {
    @Published private(set) var data: [SlideData] = []
    
    init(data: [DataItem]) {
        
        let total = data.reduce(0.0){(acc, item) -> Double in
            return acc + item.value
        }
        
        self.data = createSlides(total: total, data: data)
    }
    
    init(data: [Double]){
        let total = data.reduce(0.0, +)
        let items:[DataItem] = data.map {DataItem(title: "", value: $0, color: nil)}
        self.data = createSlides(total: total, data: items)
    }
    
    init(data: [SlideData]) {
        self.data = data
    }
    
    func createSlides(total: Double, data: [DataItem]) -> [SlideData]{
        var currentAngle: Double = -90
        var slides: [SlideData] = []
        for index in 0..<data.count {
            let slide = SlideData()
            slide.data = DataItem(title: data[index].title, value: data[index].value, color: data[index].color)
            let percentage = data[index].value / total * 100
            slide.percentage = String(format: "%.1f", percentage)
            
            slide.startAngle = .degrees(currentAngle)
            let angle = data[index].value * 360 / total
            currentAngle += angle
            slide.endAngle = .degrees(currentAngle)
            
            slides.append(slide)
        }
        return slides
    }
}

