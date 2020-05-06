//
//  PieChartSlide.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/3/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import SwiftUI

public struct PieChartSlide: View {
    var geometry: GeometryProxy
    var slideData: SlideData
    var index: Int
    @State private var show: Bool = false
    
    var path: Path {
        let chartSize = geometry.size.width
        let radius = chartSize / 2
        let centerX = radius
        let centerY = radius
         
        var path = Path()
        path.move(to: CGPoint(x: centerX, y: centerY))
        path.addArc(center: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: slideData.startAngle, endAngle: slideData.endAngle, clockwise: false)
        return path
    }
    
    public var body: some View {
        path.fill(slideData.data.color)
            .overlay(path.stroke(Color.white, lineWidth: 1))
            .scaleEffect(self.show ? 1 : 0)
            .animation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.3)
                .delay(Double(self.index) * 0.03)
        ).onAppear() {
            self.show = true
        }
    }
}

struct PieChartSlide_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            PieChartSlide(geometry: geometry, slideData: SlideData(startAngle: .degrees(-70), endAngle: .degrees(30), color: .red), index: 1)
        }
    }
}
