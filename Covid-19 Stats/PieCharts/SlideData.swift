//
//  SlideData.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/3/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import Foundation
import SwiftUI

class SlideData: Identifiable, ObservableObject {
    let id: UUID = UUID()
    var data: DataItem!
    var annotation: String = ""
    var startAngle: Angle = .degrees(0)
    var endAngle: Angle = .degrees(0)
    var percentage: String = "0"
    
    init() {}
    
    init(startAngle: Angle, endAngle: Angle) {
        self.data = DataItem(title: "", value: 0)
        self.startAngle = startAngle
        self.endAngle = endAngle
    }
    
    init(startAngle: Angle, endAngle: Angle, color: Color) {
        self.data = DataItem(title: "", value: 0, color: color)
        self.startAngle = startAngle
        self.endAngle = endAngle
    }
    
    func centerPos(radius: CGFloat) -> CGPoint {
        let midAngle:Double = (startAngle.radians + endAngle.radians) / 2
        let x = radius +  (radius * CGFloat(cos(midAngle))) / 2
        let y = radius + (radius * CGFloat(sin(midAngle))) / 2
        return CGPoint(x: x, y: y)
    }
}
